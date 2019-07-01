extends KinematicBody2D
class_name Player

const PlatformGraphNavigator = preload("res://framework/platform_graph/platform_graph_navigator.gd")
const PlayerSurfaceState = preload("res://framework/player/player_surface_state.gd")

var player_name: String
var can_grab_walls: bool
var can_grab_ceilings: bool
var can_grab_floors: bool
var movement_params: MovementParams
# Array<PlayerMovement>
var movement_types: Array
# Array<Surface>
var possible_surfaces: Array
var actions := PlayerActions.new()
var surface_state := PlayerSurfaceState.new()
var platform_graph_navigator: PlatformGraphNavigator
var velocity := Vector2.ZERO
var level # TODO: Add type back in?
var collider: CollisionShape2D
var collider_half_width_height: Vector2

func _init(player_name: String) -> void:
    self.player_name = player_name

func _enter_tree() -> void:
    var global := $"/root/Global"
    var type_configuration: PlayerTypeConfiguration = global.player_types[player_name]
    self.level = global.current_level
    self.can_grab_walls = type_configuration.movement_params.can_grab_walls
    self.can_grab_ceilings = type_configuration.movement_params.can_grab_ceilings
    self.can_grab_floors = type_configuration.movement_params.can_grab_floors
    self.movement_params = type_configuration.movement_params
    self.movement_types = type_configuration.movement_types

func _ready() -> void:
    # TODO: Somehow consolidate how collider shapes are defined?
    
    var shape_owners := get_shape_owners()
    assert(shape_owners.size() == 1)
    var owner_id: int = shape_owners[0]
    assert(shape_owner_get_shape_count(owner_id) == 1)
    var collider_shape := shape_owner_get_shape(owner_id, 0)
    assert(Geometry.do_shapes_match(collider_shape, movement_params.collider_shape))
    var transform := shape_owner_get_transform(owner_id)
    assert(abs(transform.get_rotation() - movement_params.collider_rotation) < Geometry.FLOAT_EPSILON)
    
    # Ensure we use the actual Shape2D reference that is used by Godot's collision system.
    movement_params.collider_shape = collider_shape
    
#    shape_owner_clear_shapes(owner_id)
#    shape_owner_add_shape(owner_id, movement_params.collider_shape)
    
    collider_half_width_height = movement_params.collider_half_width_height

func initialize_platform_graph_navigator(platform_graph: PlatformGraph) -> void:
    possible_surfaces = platform_graph.nodes
    platform_graph_navigator = PlatformGraphNavigator.new(self, platform_graph)

# Gets actions for the current frame.
#
# This can be overridden separately for the human and computer players:
# - The computer player will use instruction sets.
# - The human player will use system IO.
#warning-ignore:unused_argument
func _update_actions(delta: float) -> void:
    Utils.error("abstract Player._get_actions is not implemented")
    pass

# Updates physics and player states in response to the current actions.
func _process_actions() -> void:
    Utils.error("abstract Player._process_actions is not implemented")

func _physics_process(delta: float) -> void:
    # FIXME: Remove (after checking that this doesn't ever seem to trigger)
    assert(Geometry.are_floats_equal_with_epsilon(delta, Utils.PHYSICS_TIME_STEP))
    
    _update_actions(delta)
    _update_surface_state()
    
    # Uncomment to help with debugging.
    if surface_state.just_left_air:
        print("HIT surface: %8.3f:%29sP:%29sV: %s" % [OS.get_ticks_msec()/1000.0, position, \
                velocity, Surface.to_string(surface_state.grabbed_surface)])
    elif surface_state.just_entered_air:
        print("LEFT surface:%8.3f:%29sP:%29sV: %s" % [OS.get_ticks_msec()/1000.0, position, \
                velocity, Surface.to_string(surface_state.previous_grabbed_surface)])
    
    platform_graph_navigator.update()
    actions.delta = delta
    _process_actions()
    velocity = PlayerMovement.cap_velocity(velocity, movement_params)
    _update_collision_mask()
    
    # We don't need to multiply velocity by delta because MoveAndSlide already takes delta time
    # into account.
    # TODO: Use the remaining pre-collision movement that move_and_slide returns. This might be
    # needed in order to move along slopes?
    move_and_slide(velocity, Geometry.UP, false, 4, Geometry.FLOOR_MAX_ANGLE)
    
    level.descendant_physics_process_completed(self)

# Updates some basic surface-related state for player's actions and environment of the current frame.
func _update_surface_state() -> void:
    # Flip the horizontal direction of the animation according to which way the player is facing.
    if actions.pressed_right:
        surface_state.horizontal_facing_sign = 1
        surface_state.horizontal_movement_sign = 1
    elif actions.pressed_left:
        surface_state.horizontal_facing_sign = -1
        surface_state.horizontal_movement_sign = -1
    else:
        surface_state.horizontal_movement_sign = 0
    
    # Note: These might give false negatives when colliding with a corner. AFAICT, Godot will
    # simply pick one of the corner's adjacent segments to base the collision normal off of, so the
    # other segment will be ignored (and the other segment could correspond to floor or ceiling).
    surface_state.is_touching_floor = is_on_floor()
    surface_state.is_touching_ceiling = is_on_ceiling()
    surface_state.is_touching_wall = is_on_wall()
    
    surface_state.which_wall = Utils.get_which_wall_collided(self)
    surface_state.is_touching_left_wall = surface_state.which_wall == SurfaceSide.LEFT_WALL
    surface_state.is_touching_right_wall = surface_state.which_wall == SurfaceSide.RIGHT_WALL
    surface_state.is_touching_a_surface = \
            surface_state.is_touching_floor or \
            surface_state.is_touching_ceiling or \
            surface_state.is_touching_wall
    
    # Calculate the sign of a colliding wall's direction.
    surface_state.toward_wall_sign = (0 if !surface_state.is_touching_wall else \
            (1 if surface_state.which_wall == SurfaceSide.RIGHT_WALL else -1))
    
    surface_state.is_facing_wall = \
        (surface_state.which_wall == SurfaceSide.RIGHT_WALL and \
                surface_state.horizontal_facing_sign > 0) or \
        (surface_state.which_wall == SurfaceSide.LEFT_WALL and \
                surface_state.horizontal_facing_sign < 0)
    surface_state.is_pressing_into_wall = \
        (surface_state.which_wall == SurfaceSide.RIGHT_WALL and actions.pressed_right) or \
        (surface_state.which_wall == SurfaceSide.LEFT_WALL and actions.pressed_left)
    surface_state.is_pressing_away_from_wall = \
        (surface_state.which_wall == SurfaceSide.RIGHT_WALL and actions.pressed_left) or \
        (surface_state.which_wall == SurfaceSide.LEFT_WALL and actions.pressed_right)
    
    var facing_into_wall_and_pressing_up: bool = actions.pressed_up and \
            (surface_state.is_facing_wall or surface_state.is_pressing_into_wall)
    surface_state.is_triggering_wall_grab = \
            surface_state.is_pressing_into_wall or facing_into_wall_and_pressing_up
    
    surface_state.is_triggering_fall_through = actions.pressed_down and actions.just_pressed_jump
    
    # Whether we are grabbing a wall.
    surface_state.is_grabbing_wall = surface_state.is_touching_wall and \
            (surface_state.is_grabbing_wall or surface_state.is_triggering_wall_grab)
    
    # Whether we should fall through fall-through floors.
    if surface_state.is_grabbing_wall:
        surface_state.is_falling_through_floors = actions.pressed_down
    elif surface_state.is_touching_floor:
        surface_state.is_falling_through_floors = surface_state.is_triggering_fall_through
    else:
        surface_state.is_falling_through_floors = actions.pressed_down
    
    # Whether we should fall through fall-through floors.
    surface_state.is_grabbing_walk_through_walls = \
            surface_state.is_grabbing_wall or actions.pressed_up
    
    _update_which_side_is_grabbed()
    _update_which_surface_is_grabbed()

func _update_which_side_is_grabbed() -> void:
    var next_is_grabbing_floor := false
    var next_is_grabbing_ceiling := false
    var next_is_grabbing_left_wall := false
    var next_is_grabbing_right_wall := false
    
    if surface_state.is_grabbing_wall:
        next_is_grabbing_left_wall = surface_state.is_touching_left_wall
        next_is_grabbing_right_wall = surface_state.is_touching_right_wall
    elif surface_state.is_grabbing_ceiling:
        next_is_grabbing_ceiling = true
    elif surface_state.is_touching_floor:
        next_is_grabbing_floor = true
    
    var next_is_grabbing_a_surface := \
            next_is_grabbing_floor or next_is_grabbing_ceiling or \
            next_is_grabbing_left_wall or next_is_grabbing_right_wall
    
    surface_state.just_grabbed_floor = \
            next_is_grabbing_floor and !surface_state.is_grabbing_floor
    surface_state.just_grabbed_ceiling = \
            next_is_grabbing_ceiling and !surface_state.is_grabbing_ceiling
    surface_state.just_grabbed_left_wall = \
            next_is_grabbing_left_wall and !surface_state.is_grabbing_left_wall
    surface_state.just_grabbed_right_wall = \
            next_is_grabbing_right_wall and !surface_state.is_grabbing_right_wall
    surface_state.just_grabbed_a_surface = \
            surface_state.just_grabbed_floor or \
            surface_state.just_grabbed_ceiling or \
            surface_state.just_grabbed_left_wall or \
            surface_state.just_grabbed_right_wall
    
    surface_state.just_entered_air = \
            !next_is_grabbing_a_surface and surface_state.is_grabbing_a_surface
    surface_state.just_left_air = \
            next_is_grabbing_a_surface and !surface_state.is_grabbing_a_surface
    
    surface_state.is_grabbing_floor = next_is_grabbing_floor
    surface_state.is_grabbing_ceiling = next_is_grabbing_ceiling
    surface_state.is_grabbing_left_wall = next_is_grabbing_left_wall
    surface_state.is_grabbing_right_wall = next_is_grabbing_right_wall
    surface_state.is_grabbing_a_surface = next_is_grabbing_a_surface
    
    surface_state.grabbed_side = \
            SurfaceSide.FLOOR if surface_state.is_grabbing_floor else \
            (SurfaceSide.CEILING if surface_state.is_grabbing_ceiling else \
            (SurfaceSide.LEFT_WALL if surface_state.is_grabbing_left_wall else \
            (SurfaceSide.RIGHT_WALL if surface_state.is_grabbing_right_wall else \
            SurfaceSide.NONE)))
    match surface_state.grabbed_side:
        SurfaceSide.FLOOR:
            surface_state.grabbed_surface_normal = Geometry.UP
        SurfaceSide.CEILING:
            surface_state.grabbed_surface_normal = Geometry.DOWN
        SurfaceSide.LEFT_WALL:
            surface_state.grabbed_surface_normal = Geometry.RIGHT
        SurfaceSide.RIGHT_WALL:
            surface_state.grabbed_surface_normal = Geometry.LEFT

func _update_which_surface_is_grabbed() -> void:
    var collision := _get_attached_surface_collision(self, surface_state)
    assert((collision != null) == surface_state.is_grabbing_a_surface)
    
    if surface_state.is_grabbing_a_surface:
        var next_grab_position := collision.position
        surface_state.just_changed_grab_position = \
                surface_state.just_left_air or \
                next_grab_position != surface_state.grab_position
        surface_state.grab_position = next_grab_position
        
        var next_grabbed_tile_map := collision.collider
        surface_state.just_changed_tile_map = \
                surface_state.just_left_air or \
                next_grabbed_tile_map != surface_state.grabbed_tile_map
        surface_state.grabbed_tile_map = next_grabbed_tile_map
        
        var next_grab_position_tile_map_coord: Vector2 = Geometry.get_collision_tile_map_coord( \
                surface_state.grab_position, surface_state.grabbed_tile_map, \
                surface_state.is_touching_floor, surface_state.is_touching_ceiling, \
                surface_state.is_touching_left_wall, surface_state.is_touching_right_wall)
        surface_state.just_changed_tile_map_coord = \
                surface_state.just_left_air or \
                next_grab_position_tile_map_coord != surface_state.grab_position_tile_map_coord
        surface_state.grab_position_tile_map_coord = next_grab_position_tile_map_coord
        
        var next_grabbed_surface := \
                platform_graph_navigator.calculate_grabbed_surface(surface_state)
        surface_state.just_changed_surface = \
                surface_state.just_left_air or \
                next_grabbed_surface != surface_state.grabbed_surface
        if surface_state.just_changed_surface:
            surface_state.previous_grabbed_surface = surface_state.grabbed_surface
        surface_state.grabbed_surface = next_grabbed_surface
        
        surface_state.player_center_position_along_surface.match_current_grab( \
                surface_state.grabbed_surface, position)
    
    else:
        if surface_state.just_entered_air:
            surface_state.just_changed_grab_position = true
            surface_state.just_changed_tile_map = true
            surface_state.just_changed_tile_map_coord = true
            surface_state.just_changed_surface = true
            surface_state.previous_grabbed_surface = surface_state.grabbed_surface
        
        surface_state.grab_position = Vector2.INF
        surface_state.grabbed_tile_map = null
        surface_state.grab_position_tile_map_coord = Vector2.INF
        surface_state.grabbed_surface = null
        surface_state.player_center_position_along_surface.reset()

# Update whether or not we should currently consider collisions with fall-through floors and
# walk-through walls.
func _update_collision_mask() -> void:
    set_collision_mask_bit(1, !surface_state.is_falling_through_floors)
    set_collision_mask_bit(2, surface_state.is_grabbing_walk_through_walls)

static func _get_attached_surface_collision( \
        body: KinematicBody2D, surface_state: PlayerSurfaceState) -> KinematicCollision2D:
    var closest_normal_diff: float = PI
    var closest_collision: KinematicCollision2D
    var current_normal_diff: float
    var current_collision: KinematicCollision2D
    for i in range(body.get_slide_count()):
        current_collision = body.get_slide_collision(i)
        
        if surface_state.is_grabbing_floor:
            current_normal_diff = abs(current_collision.normal.angle_to(Geometry.UP))
        elif surface_state.is_grabbing_ceiling:
            current_normal_diff = abs(current_collision.normal.angle_to(Geometry.DOWN))
        elif surface_state.is_grabbing_left_wall:
            current_normal_diff = abs(current_collision.normal.angle_to(Geometry.RIGHT))
        elif surface_state.is_grabbing_right_wall:
            current_normal_diff = abs(current_collision.normal.angle_to(Geometry.LEFT))
        else:
            continue
        
        if current_normal_diff < closest_normal_diff:
            closest_normal_diff = current_normal_diff
            closest_collision = current_collision
    
    return closest_collision
