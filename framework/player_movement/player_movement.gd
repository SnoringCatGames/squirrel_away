# A specific type of traversal movement, configured for a specific Player.
extends Reference
class_name PlayerMovement

const MovementConstraint = preload("res://framework/player_movement/movement_constraint.gd")
const PlayerInstruction = preload("res://framework/player_movement/player_instruction.gd")

# TODO: Adjust this
const SURFACE_CLOSE_DISTANCE_THRESHOLD := 512.0
const DOWNWARD_DISTANCE_TO_CHECK_FOR_FALLING := 10000.0

const TILE_MAP_COLLISION_LAYER := 2
const EDGE_MOVEMENT_TEST_MARGIN := 4.0
const EDGE_MOVEMENT_ACTUAL_MARGIN := 5.0
var JUMP_RELEASE_INSTRUCTION = PlayerInstruction.new("jump", -1, false)

var name: String
var params: MovementParams
var surfaces: Array
var surface_parser: SurfaceParser

var can_traverse_edge := false
var can_traverse_to_air := false
var can_traverse_from_air := false

func _init(name: String, params: MovementParams) -> void:
    self.name = name
    self.params = params

func set_surfaces(surface_parser: SurfaceParser) -> void:
    self.surface_parser = surface_parser
    self.surfaces = surface_parser.get_subset_of_surfaces( \
            params.can_grab_walls, params.can_grab_ceilings, params.can_grab_floors)

func get_all_edges_from_surface(space_state: Physics2DDirectSpaceState, surface: Surface) -> Array:
    Utils.error( \
            "Abstract PlayerMovement.get_all_edges_from_surface is not implemented")
    return []

func get_instructions_to_air(space_state: Physics2DDirectSpaceState, \
        start: PositionAlongSurface, end: Vector2) -> PlayerInstructions:
    Utils.error("Abstract PlayerMovement.get_instructions_to_air is not implemented")
    return null

func get_all_reachable_surface_instructions_from_air(space_state: Physics2DDirectSpaceState, \
        start: Vector2, end: PositionAlongSurface, start_velocity: Vector2) -> Array:
    Utils.error("Abstract PlayerMovement.get_all_reachable_surface_instructions_from_air is not implemented")
    return []

func get_max_upward_distance() -> float:
    Utils.error("Abstract PlayerMovement.get_max_upward_distance is not implemented")
    return 0.0

func get_max_horizontal_distance() -> float:
    Utils.error("Abstract PlayerMovement.get_max_horizontal_distance is not implemented")
    return 0.0

static func update_velocity_in_air( \
        velocity: Vector2, delta: float, is_pressing_jump: bool, is_first_jump: bool, \
        horizontal_movement_sign: int, movement_params: MovementParams) -> Vector2:
    var is_ascending_from_jump := velocity.y < 0 and is_pressing_jump
    
    # Make gravity stronger when falling. This creates a more satisfying jump.
    # Similarly, make gravity stronger for double jumps.
    var gravity_multiplier := 1.0 if !is_ascending_from_jump else \
            (movement_params.ascent_gravity_multiplier if is_first_jump \
                    else movement_params.ascent_double_jump_gravity_multiplier)
    
    # Vertical movement.
    velocity.y += delta * movement_params.gravity * gravity_multiplier
    
    # Horizontal movement.
    velocity.x += movement_params.in_air_horizontal_acceleration * horizontal_movement_sign
    
    return velocity

static func cap_velocity(velocity: Vector2, movement_params: MovementParams) -> Vector2:
    # Cap horizontal speed at a max value.
    velocity.x = clamp(velocity.x, -movement_params.current_max_horizontal_speed, \
            movement_params.current_max_horizontal_speed)
    
    # Kill horizontal speed below a min value.
    if velocity.x > -movement_params.min_horizontal_speed and \
            velocity.x < movement_params.min_horizontal_speed:
        velocity.x = 0
    
    # Cap vertical speed at a max value.
    velocity.y = clamp(velocity.y, -movement_params.max_vertical_speed, \
            movement_params.max_vertical_speed)
    
    # Kill vertical speed below a min value.
    if velocity.y > -movement_params.min_vertical_speed and \
            velocity.y < movement_params.min_vertical_speed:
        velocity.y = 0
    
    return velocity

# Checks whether a collision would occur with any Surface during the given _MovementSection. This
# is calculated by stepping through each physics frame, which should exactly emulate the actual
# Player trajectory that would be used.
func check_movement_section_for_collision( \
        space_state: Physics2DDirectSpaceState, movement_section: _MovementSection) -> Surface:
    var delta := Utils.PHYSICS_TIME_STEP
    var is_first_jump := true
    var previous_time := movement_section.time
    var current_time := movement_section.time
    var end_time := movement_section.instructions.duration
    var position := movement_section.position
    var velocity := movement_section.velocity
    var is_pressing_jump := movement_section.active_inputs.has("jump")
    var displacement: Vector2
    var colliding_surface: Surface
    
    # The Godot collision-detection APIs use this data structure.
    var shape_query_params := Physics2DShapeQueryParameters.new()
    shape_query_params.collide_with_areas = false
    shape_query_params.collide_with_bodies = true
    shape_query_params.collision_layer = TILE_MAP_COLLISION_LAYER
    shape_query_params.exclude = []
    shape_query_params.margin = EDGE_MOVEMENT_TEST_MARGIN
    shape_query_params.motion = Vector2.ZERO
    shape_query_params.shape_rid = params.collider_shape.get_rid()
    shape_query_params.transform = Transform2D.IDENTITY
    
    # Iterate through each physics frame, checking each for a collision.
    while current_time < end_time:
        # Update position for this frame.
        previous_time = current_time
        current_time += delta
        displacement = velocity * delta
        shape_query_params.transform = Transform2D(0.0, position)
        shape_query_params.motion = displacement
        position += displacement
        
        # Check for collision.
        colliding_surface = check_frame_for_collision(space_state, shape_query_params)
        if colliding_surface != null:
            return colliding_surface
        
        # Determine whether the jump button is still being pressed.
        if is_pressing_jump and movement_section.instructions.is_instruction_in_range( \
                JUMP_RELEASE_INSTRUCTION, previous_time, current_time):
            is_pressing_jump = false
        
        # Update velocity for the next frame.
        velocity = update_velocity_in_air(velocity, delta, is_pressing_jump, is_first_jump, \
                movement_section.horizontal_movement_sign, params)
        velocity = cap_velocity(velocity, params)
    
    # Check the last frame that puts us up to end_time.
    delta = end_time - current_time
    displacement = velocity * delta
    shape_query_params.transform = Transform2D(0.0, position)
    shape_query_params.motion = displacement
    colliding_surface = check_frame_for_collision(space_state, shape_query_params)
    if colliding_surface != null:
        return colliding_surface
    
    return null

# Determines whether the given motion of the given shape would collide with a Surface. If a
# collision would occur, this returns the Surface; otherwise, this returns null.
func check_frame_for_collision(space_state: Physics2DDirectSpaceState, \
        shape_query_params: Physics2DShapeQueryParameters) -> Surface:
    # FIXME: B: Check whether all of the level setup must be called from within an early
    #   _physics_process callback (space might have a lock otherwise)?
    
    var collision_points := space_state.collide_shape(shape_query_params, 1)
    if collision_points.empty():
        return null
    
    var collision_point: Vector2 = collision_points[0]
    var direction := shape_query_params.motion.normalized()
    var from := collision_point - direction * 0.001
    var to := collision_point + direction * 1000000
    var collision := space_state.intersect_ray(from, to, shape_query_params.exclude, \
            shape_query_params.collision_layer)
    
    var side: int
    var is_touching_floor := false
    var is_touching_ceiling := false
    var is_touching_left_wall := false
    var is_touching_right_wall := false
    if abs(collision.normal.angle_to(Geometry.UP)) <= Geometry.FLOOR_MAX_ANGLE:
        side = SurfaceSide.FLOOR
        is_touching_floor = true
    elif abs(collision.normal.angle_to(Geometry.DOWN)) <= Geometry.FLOOR_MAX_ANGLE:
        side = SurfaceSide.CEILING
        is_touching_ceiling = true
    elif collision.normal.x > 0:
        side = SurfaceSide.LEFT_WALL
        is_touching_left_wall = true
    else:
        side = SurfaceSide.RIGHT_WALL
        is_touching_right_wall = true
    
    var tile_map: TileMap = collision.collider
    var tile_map_coord: Vector2 = Geometry.get_collision_tile_map_coord( \
            collision_point, tile_map, is_touching_floor, is_touching_ceiling, \
            is_touching_left_wall, is_touching_right_wall)
    var tile_map_index: int = Geometry.get_tile_map_index_from_grid_coord(tile_map_coord, tile_map)
    
    return surface_parser.get_surface_for_tile(tile_map, tile_map_index, side)

static func _calculate_constraints( \
        colliding_surface: Surface, constraint_offset: Vector2) -> Array:
    var passing_point_a: Vector2
    var constraint_a: MovementConstraint
    var passing_point_b: Vector2
    var constraint_b: MovementConstraint
    
    match colliding_surface.side:
        SurfaceSide.FLOOR:
            # Left end
            passing_point_a = colliding_surface.vertices[0] + \
                    Vector2(-constraint_offset.x, -constraint_offset.y)
            constraint_a = MovementConstraint.new(passing_point_a, true, true)
            # Right end
            passing_point_b = colliding_surface.vertices[colliding_surface.vertices.size() - 1] + \
                    Vector2(constraint_offset.x, -constraint_offset.y)
            constraint_b = MovementConstraint.new(passing_point_b, true, false)
        SurfaceSide.CEILING:
            # Left end
            passing_point_a = colliding_surface.vertices[colliding_surface.vertices.size() - 1] + \
                    Vector2(-constraint_offset.x, constraint_offset.y)
            constraint_a = MovementConstraint.new(passing_point_a, true, true)
            # Right end
            passing_point_b = colliding_surface.vertices[0] + \
                    Vector2(constraint_offset.x, constraint_offset.y)
            constraint_b = MovementConstraint.new(passing_point_b, true, false)
        SurfaceSide.LEFT_WALL:
            # Top end
            passing_point_a = colliding_surface.vertices[0] + \
                    Vector2(constraint_offset.x, -constraint_offset.y)
            constraint_a = MovementConstraint.new(passing_point_a, false, true)
            # Bottom end
            passing_point_b = colliding_surface.vertices[colliding_surface.vertices.size() - 1] + \
                    Vector2(constraint_offset.x, constraint_offset.y)
            constraint_b = MovementConstraint.new(passing_point_b, false, false)
        SurfaceSide.RIGHT_WALL:
            # Top end
            passing_point_a = colliding_surface.vertices[colliding_surface.vertices.size() - 1] + \
                    Vector2(-constraint_offset.x, -constraint_offset.y)
            constraint_a = MovementConstraint.new(passing_point_a, false, true)
            # Bottom end
            passing_point_b = colliding_surface.vertices[0] + \
                    Vector2(-constraint_offset.x, constraint_offset.y)
            constraint_b = MovementConstraint.new(passing_point_b, false, false)
    
    return [constraint_a, constraint_b]

# This represents a partial "section" of an overall jump movement. This is used as an temporary
# data structure during the calculation of the jump instructions. A single _MovementSection
# represents a single portion of the jump where the player is moving in the same horizontal
# direction.
class _MovementSection:
    # The same PlayerInstructions instance is shared across all temporary _MovementSections that
    # are used during an overall jump calculation.
    var instructions: PlayerInstructions
    
    # This index enables different _MovementSection instances to reference different sections of
    # the overall instruction set.
    var instruction_index: int # FIXME: Remove? Do we need this?
    
    # The time that this _MovementSection starts, relative to the start of the overall instruction
    # set.
    var time: float
    
    # Which inputs are currently being pressed at the start of this _MovementSection.
    # Dictionary<string, bool>
    var active_inputs: Dictionary
    
    # The position at the start of this _MovementSection.
    var position: Vector2
    
    # The velocity at the start of this _MovementSection.
    var velocity: Vector2
    
    # The direction of horizontal movement for this _MovementSection.
    var horizontal_movement_sign: int
    
    # The maximum height of the overall jump.
    var max_height: float

func _get_nearby_and_fallable_surfaces(origin_surface: Surface) -> Array:
    # TODO: Prevent duplicate work from finding matching surfaces as both nearby and fallable.
    var results := _get_nearby_surfaces(origin_surface, SURFACE_CLOSE_DISTANCE_THRESHOLD, surfaces)
    
    # FIXME: Update _get_closest_fallable_surface to support falling from the center of
    #        fall-through surfaces (consider the whole surface, rather than just the ends).
    # TODO: Consider velocity changes due to gravity.
    # TODO: Add support for choosing the closest "non-occluded" surface to the destination, rather
    #       than the closest surface to the origin.
    # TODO: Add support for falling to surfaces other than just the closest one.
    
    var origin_vertex: Vector2
    var closest_fallable_surface: Surface
    
    origin_vertex = origin_surface.vertices[0]
    closest_fallable_surface = _get_closest_fallable_surface(origin_vertex, surfaces, true)
    if !results.has(closest_fallable_surface):
        results.push_back(closest_fallable_surface)
    
    origin_vertex = origin_surface.vertices[origin_surface.vertices.size() - 1]
    closest_fallable_surface = _get_closest_fallable_surface(origin_vertex, surfaces, true)
    if !results.has(closest_fallable_surface):
        results.push_back(closest_fallable_surface)
    
    return results

# Gets all other surfaces that are near the given surface.
static func _get_nearby_surfaces(target_surface: Surface, distance_threshold: float, \
        other_surfaces: Array) -> Array:
    var result := []
    for other_surface in other_surfaces:
        if _get_are_surfaces_close(target_surface, other_surface, distance_threshold) and \
                target_surface != other_surface:
            result.push_back(other_surface)
    return result

static func _get_are_surfaces_close(surface_a: Surface, surface_b: Surface, \
        distance_threshold: float) -> bool:
    var vertices_a := surface_a.vertices
    var vertices_b := surface_b.vertices
    var vertex_a_a: Vector2
    var vertex_a_b: Vector2
    var vertex_b_a: Vector2
    var vertex_b_b: Vector2
    
    var expanded_bounding_box_a = surface_a.bounding_box.grow(distance_threshold)
    if expanded_bounding_box_a.intersects(surface_b.bounding_box):
        var expanded_bounding_box_b = surface_b.bounding_box.grow(distance_threshold)
        var distance_squared_threshold = distance_threshold * distance_threshold
        
        # Compare each segment in A with each vertex in B.
        for i_a in range(vertices_a.size() - 1):
            vertex_a_a = vertices_a[i_a]
            vertex_a_b = vertices_a[i_a + 1]
            
            for i_b in range(vertices_b.size()):
                vertex_b_a = vertices_b[i_b]
                
                if expanded_bounding_box_a.has_point(vertex_b_a) and \
                        Geometry.get_distance_squared_from_point_to_segment( \
                                vertex_b_a, vertex_a_a, vertex_a_b) <= distance_squared_threshold:
                    return true
        
        # Compare each vertex in A with each segment in B.
        for i_a in range(vertices_a.size()):
            vertex_a_a = vertices_a[i_a]
            
            for i_b in range(vertices_b.size() - 1):
                vertex_b_a = vertices_b[i_b]
                vertex_b_b = vertices_b[i_b + 1]
                
                if expanded_bounding_box_b.has_point(vertex_a_a) and \
                        Geometry.get_distance_squared_from_point_to_segment( \
                                vertex_a_a, vertex_b_a, vertex_b_b) <= distance_squared_threshold:
                    return true
            
            # Handle the degenerate case of single-vertex surfaces.
            if vertices_b.size() == 1:
                if vertex_a_a.distance_squared_to(vertices_b[0]) <= distance_squared_threshold:
                    return true
    
    return false

# Gets the closest surface that can be reached by falling from the given point.
func _get_closest_fallable_surface(start: Vector2, surfaces: Array, \
        can_use_horizontal_distance := false) -> Surface:
    var end_x_distance = DOWNWARD_DISTANCE_TO_CHECK_FOR_FALLING * \
            params.max_horizontal_speed_default / \
            params.max_vertical_speed
    var end_y = start.y + DOWNWARD_DISTANCE_TO_CHECK_FOR_FALLING
    
    if can_use_horizontal_distance:
        var start_x_distance = get_max_horizontal_distance()
        
        var leftmost_start = Vector2(start.x - start_x_distance, start.y)
        var rightmost_start = Vector2(start.x + start_x_distance, start.y)
        var leftmost_end = Vector2(leftmost_start.x - end_x_distance, end_y)
        var rightmost_end = Vector2(rightmost_start.x + end_x_distance, end_y)
        
        return _get_closest_fallable_surface_intersecting_polygon(start, \
                PoolVector2Array([leftmost_start, rightmost_start, rightmost_end, leftmost_end]), \
                surfaces)
    else:
        var leftmost_end = Vector2(start.x - end_x_distance, end_y)
        var rightmost_end = Vector2(start.x + end_x_distance, end_y)
        
        return _get_closest_fallable_surface_intersecting_triangle(start, start, leftmost_end, \
                rightmost_end, surfaces)

static func _get_closest_fallable_surface_intersecting_triangle(target: Vector2, \
        triangle_a: Vector2, triangle_b: Vector2, triangle_c: Vector2, surfaces: Array) -> Surface:
    var closest_surface: Surface
    var closest_distance_squared: float = INF
    var current_distance_squared: float
    
    for current_surface in surfaces:
        current_distance_squared = Geometry.distance_squared_from_point_to_rect(target, \
                current_surface.bounding_box)
        if current_distance_squared < closest_distance_squared:
            if Geometry.do_polyline_and_triangle_intersect(current_surface.vertices, \
                    triangle_a, triangle_b, triangle_c):
                # FIXME: LEFT OFF HERE: -B: ****
                # - Calculate instruction set (or determine whether it's not possible)
                # - Reconcile this with how PlayerMovement now works...
                current_distance_squared = \
                        Geometry.get_distance_squared_from_point_to_polyline( \
                                target, current_surface.vertices)
                if current_distance_squared < closest_distance_squared:
                        closest_distance_squared = current_distance_squared
                        closest_surface = current_surface
    
    return closest_surface

static func _get_closest_fallable_surface_intersecting_polygon(target: Vector2, \
        polygon: PoolVector2Array, surfaces: Array) -> Surface:
    var closest_surface: Surface
    var closest_distance_squared: float = INF
    var current_distance_squared: float
    
    for current_surface in surfaces:
        current_distance_squared = Geometry.distance_squared_from_point_to_rect(target, \
                current_surface.bounding_box)
        if current_distance_squared < closest_distance_squared:
            if Geometry.do_polyline_and_polygon_intersect(current_surface.vertices, polygon):
                # FIXME: LEFT OFF HERE: -B: **** Copy above version
                current_distance_squared = \
                        Geometry.get_distance_squared_from_point_to_polyline( \
                                target, current_surface.vertices)
                if current_distance_squared < closest_distance_squared:
                        closest_distance_squared = current_distance_squared
                        closest_surface = current_surface
    
    return closest_surface
