tool
class_name SquirrelAwayTileSetWithManyAngles
extends SurfacesTileSet


const TILE_NAME_FOR_ANGLE_A90 := "0_tile_with_90s"
const TILE_NAME_FOR_ANGLE_A45 := "1_tile_with_45s"
const TILE_NAME_FOR_ANGLE_A27 := "2_tile_with_27s"

const _PROPERTIES_MANIFEST := [
    ["disabled", ["ungrabbable_tile"]],
    ["slippery", ["slippery_tile"]],
    ["sticky", ["sticky_tile",]],
    ["fast", ["fast_tile",]],
    ["slow", ["slow_tile",]],
]

const INVALID_BITMASK := -1
const FULL_BITMASK_3x3 := \
        TileSet.BIND_TOPLEFT | \
        TileSet.BIND_TOP | \
        TileSet.BIND_TOPRIGHT | \
        TileSet.BIND_LEFT | \
        TileSet.BIND_CENTER | \
        TileSet.BIND_RIGHT | \
        TileSet.BIND_BOTTOMLEFT | \
        TileSet.BIND_BOTTOM | \
        TileSet.BIND_BOTTOMRIGHT

const TILE_WITH_SEPARATED_DEPTHS_NAME := "tiles_with_separated_depths"

# NOTE: These positions need to be match the corresponding tile-set image.
const INTERIOR_SUBTILE_POSITIONS := {
    exposed_sides = {
        top_left = Vector2(0, 4),
        top = Vector2(1, 4),
        top_right = Vector2(2, 4),
        left = Vector2(0, 5),
        none = Vector2(1, 5),
        right = Vector2(2, 5),
        bottom_left = Vector2(0, 6),
        bottom = Vector2(1, 6),
        bottom_right = Vector2(2, 6),
        left_right = Vector2(3, 4),
        bottom_left_right = Vector2(4, 4),
        top_bottom = Vector2(5, 4),
        top_bottom_right = Vector2(3, 5),
        all = Vector2(4, 5),
        top_bottom_left = Vector2(5, 5),
        top_left_right = Vector2(4, 6),
    },
    exposed_corners = {
        bottom_right = Vector2(6, 4),
        bottom_left_bottom_right = Vector2(7, 4),
        bottom_left = Vector2(8, 4),
        top_right_bottom_right = Vector2(6, 5),
        all = Vector2(7, 5),
        top_left_bottom_left = Vector2(8, 5),
        top_right = Vector2(6, 6),
        top_left_top_right = Vector2(7, 6),
        top_left = Vector2(8, 6),
        top_right_bottom_left_bottom_right = Vector2(9, 4),
        top_left_bottom_left_bottom_right = Vector2(10, 4),
        top_left_top_right_bottom_right = Vector2(9, 5),
        top_left_top_right_bottom_left = Vector2(10, 5),
        top_right_bottom_left = Vector2(9, 6),
        top_left_bottom_right = Vector2(10, 6),
    },
    exposed_sides_and_corners = {
        top_left_sides_bottom_right_corner = Vector2(0, 7),
        top_right_sides_bottom_left_corner = Vector2(1, 7),
        bottom_left_sides_top_right_corner = Vector2(0, 8),
        bottom_right_sides_top_left_corner = Vector2(1, 8),
        top_side_bottom_right_corner = Vector2(2, 7),
        top_side_bottom_left_bottom_right_corners = Vector2(3, 7),
        top_side_bottom_left_corner = Vector2(4, 7),
        bottom_side_top_right_corner = Vector2(2, 8),
        bottom_side_top_left_top_right_corners = Vector2(3, 8),
        bottom_side_top_left_corner = Vector2(4, 8),
        left_side_bottom_right_corner = Vector2(5, 7),
        left_side_top_right_corner = Vector2(5, 8),
        left_side_top_right_bottom_right_corners = Vector2(7, 7),
        right_side_bottom_left_corner = Vector2(6, 7),
        right_side_top_left_corner = Vector2(6, 8),
        right_side_top_left_bottom_left_corners = Vector2(8, 7),
    },
}

var tile_id_for_angle_a90: int
var tile_id_for_angle_a45: int
var tile_id_for_angle_a27: int


func _init().(_PROPERTIES_MANIFEST) -> void:
    tile_id_for_angle_a90 = find_tile_by_name(TILE_NAME_FOR_ANGLE_A90)
    tile_id_for_angle_a45 = find_tile_by_name(TILE_NAME_FOR_ANGLE_A45)
    tile_id_for_angle_a27 = find_tile_by_name(TILE_NAME_FOR_ANGLE_A27)


func _is_tile_bound( \
        drawn_id: int, \
        neighbor_id: int) -> bool:
    if neighbor_id == TileMap.INVALID_CELL:
        return false
    
    return true


func _forward_subtile_selection(
        tile_id: int,
        bitmask: int,
        tile_map: Object,
        cell_position: Vector2):
    var proximity := get_cell_proximity(
            tile_id,
            bitmask,
            tile_map,
            cell_position)
    
    var subtile_position
    match proximity.angle_type:
        CellAngleType.A90:
            subtile_position = _choose_90_degree_subtile(proximity)
        CellAngleType.A45:
            subtile_position = _choose_45_degree_subtile(proximity)
        CellAngleType.A27:
            subtile_position = _choose_27_degree_subtile(proximity)
        _:
            # Do nothing.
            pass
    
    if subtile_position != Vector2.INF:
        return subtile_position
    else:
        # NOTE:
        # - Not returning any value here is terrible.
        # - However, apparently Godot doesn't support returning any actual
        #   values that would indicate redirecting back to the default behavior.
        return


func get_cell_proximity(
        tile_id: int,
        bitmask: int,
        tile_map: TileMap,
        cell_position: Vector2) -> CellProximity:
    var top_left_neighbor_position := cell_position + Vector2(-1, -1)
    var top_neighbor_position := cell_position + Vector2(0, -1)
    var top_right_neighbor_position := cell_position + Vector2(1, -1)
    var left_neighbor_position := cell_position + Vector2(-1, 0)
    var right_neighbor_position := cell_position + Vector2(1, 0)
    var bottom_left_neighbor_position := cell_position + Vector2(-1, 1)
    var bottom_neighbor_position := cell_position + Vector2(0, 1)
    var bottom_right_neighbor_position := cell_position + Vector2(1, 1)
    
    var top_left_neighbor_bitmask := get_cell_bitmask(
            top_left_neighbor_position,
            tile_map)
    var top_neighbor_bitmask := get_cell_bitmask(
            top_neighbor_position,
            tile_map)
    var top_right_neighbor_bitmask := get_cell_bitmask(
            top_right_neighbor_position,
            tile_map)
    var left_neighbor_bitmask := get_cell_bitmask(
            left_neighbor_position,
            tile_map)
    var right_neighbor_bitmask := get_cell_bitmask(
            right_neighbor_position,
            tile_map)
    var bottom_left_neighbor_bitmask := get_cell_bitmask(
            bottom_left_neighbor_position,
            tile_map)
    var bottom_neighbor_bitmask := get_cell_bitmask(
            bottom_neighbor_position,
            tile_map)
    var bottom_right_neighbor_bitmask := get_cell_bitmask(
            bottom_right_neighbor_position,
            tile_map)
    
    var is_top_left_neighbor_exposed_at_top_left := \
            !(top_left_neighbor_bitmask & BIND_TOPLEFT)
    var is_top_neighbor_exposed_at_top := \
            !(top_neighbor_bitmask & BIND_TOPLEFT) or \
            !(top_neighbor_bitmask & BIND_TOP) or \
            !(top_neighbor_bitmask & BIND_TOPRIGHT)
    var is_top_right_neighbor_exposed_at_top_right := \
            !(top_right_neighbor_bitmask & BIND_TOPRIGHT)
    var is_left_neighbor_exposed_at_left := \
            !(left_neighbor_bitmask & BIND_TOPLEFT) or \
            !(left_neighbor_bitmask & BIND_LEFT) or \
            !(left_neighbor_bitmask & BIND_BOTTOMLEFT)
    var is_right_neighbor_exposed_at_right := \
            !(right_neighbor_bitmask & BIND_TOPRIGHT) or \
            !(right_neighbor_bitmask & BIND_RIGHT) or \
            !(right_neighbor_bitmask & BIND_BOTTOMRIGHT)
    var is_bottom_left_neighbor_exposed_at_bottom_left := \
            !(bottom_left_neighbor_bitmask & BIND_BOTTOMLEFT)
    var is_bottom_neighbor_exposed_at_bottom := \
            !(bottom_neighbor_bitmask & BIND_BOTTOMLEFT) or \
            !(bottom_neighbor_bitmask & BIND_BOTTOM) or \
            !(bottom_neighbor_bitmask & BIND_BOTTOMRIGHT)
    var is_bottom_right_neighbor_exposed_at_bottom_right := \
            !(bottom_right_neighbor_bitmask & BIND_BOTTOMRIGHT)
    
    var top_neighbor_tile_id := tile_map.get_cellv(top_neighbor_position)
    var bottom_neighbor_tile_id := tile_map.get_cellv(bottom_neighbor_position)
    var left_neighbor_tile_id := tile_map.get_cellv(left_neighbor_position)
    var right_neighbor_tile_id := tile_map.get_cellv(right_neighbor_position)
    
    var angle_type := get_angle_type_from_tile_id(tile_id)
    var top_neighbor_angle_type := \
            get_angle_type_from_tile_id(top_neighbor_tile_id)
    var bottom_neighbor_angle_type := \
            get_angle_type_from_tile_id(bottom_neighbor_tile_id)
    var left_neighbor_angle_type := \
            get_angle_type_from_tile_id(left_neighbor_tile_id)
    var right_neighbor_angle_type := \
            get_angle_type_from_tile_id(right_neighbor_tile_id)
    
    var proximity := CellProximity.new()
    proximity.position = cell_position
    proximity.bitmask = bitmask
    proximity.is_top_left_neighbor_exposed_at_top_left = \
            is_top_left_neighbor_exposed_at_top_left
    proximity.is_top_neighbor_exposed_at_top = \
            is_top_neighbor_exposed_at_top
    proximity.is_top_right_neighbor_exposed_at_top_right = \
            is_top_right_neighbor_exposed_at_top_right
    proximity.is_left_neighbor_exposed_at_left = \
            is_left_neighbor_exposed_at_left
    proximity.is_right_neighbor_exposed_at_right = \
            is_right_neighbor_exposed_at_right
    proximity.is_bottom_left_neighbor_exposed_at_bottom_left = \
            is_bottom_left_neighbor_exposed_at_bottom_left
    proximity.is_bottom_neighbor_exposed_at_bottom = \
            is_bottom_neighbor_exposed_at_bottom
    proximity.is_bottom_right_neighbor_exposed_at_bottom_right = \
            is_bottom_right_neighbor_exposed_at_bottom_right
    proximity.angle_type = angle_type
    proximity.top_neighbor_angle_type = top_neighbor_angle_type
    proximity.bottom_neighbor_angle_type = bottom_neighbor_angle_type
    proximity.left_neighbor_angle_type = left_neighbor_angle_type
    proximity.right_neighbor_angle_type = right_neighbor_angle_type
    
    return proximity


# FIXME: LEFT OFF HERE: -----------------------------------------------
# ### Add automatic subtile selection according to neighbor slopes.
# - Only have three tiles:
#   - 90s
#   - 45s
#   - 27s
# - Each tile then redundantly includes many/all of the needed join and
#   interior-transition subtiles.
# - Never auto-change tile_id.
#   - Instead, rely on level author choosing the tile_id.
#   - We then use tile_ids to determine correct joins and interior-transition
#     subtiles.
# - PROBLEM: Will involve a lot of redundant art, shape configuration, and
#   subtile-selection-join-encoding for all of the join and interior-transition
#   subtiles.
func _choose_90_degree_subtile(proximity: CellProximity) -> Vector2:
    if proximity.bitmask != FULL_BITMASK_3x3:
        return Vector2.INF
    
    if proximity.is_top_neighbor_exposed_at_top:
        if proximity.is_bottom_neighbor_exposed_at_bottom:
            if proximity.is_left_neighbor_exposed_at_left:
                if proximity.is_right_neighbor_exposed_at_right:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_sides.all
                else:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_sides.top_bottom_left
            elif proximity.is_right_neighbor_exposed_at_right:
                return INTERIOR_SUBTILE_POSITIONS.exposed_sides.top_bottom_right
            else:
                return INTERIOR_SUBTILE_POSITIONS.exposed_sides.top_bottom
        elif proximity.is_left_neighbor_exposed_at_left:
            if proximity.is_right_neighbor_exposed_at_right:
                return INTERIOR_SUBTILE_POSITIONS.exposed_sides.top_left_right
            else:
                if proximity.is_bottom_right_neighbor_exposed_at_bottom_right:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.top_left_sides_bottom_right_corner
                else:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_sides.top_left
        elif proximity.is_right_neighbor_exposed_at_right:
            if proximity.is_bottom_left_neighbor_exposed_at_bottom_left:
                return INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.top_right_sides_bottom_left_corner
            else:
                return INTERIOR_SUBTILE_POSITIONS.exposed_sides.top_right
        else:
            if proximity.is_bottom_left_neighbor_exposed_at_bottom_left:
                if proximity.is_bottom_right_neighbor_exposed_at_bottom_right:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.top_side_bottom_left_bottom_right_corners
                else:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.top_side_bottom_left_corner
            elif proximity.is_bottom_right_neighbor_exposed_at_bottom_right:
                return INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.top_side_bottom_right_corner
            else:
                return INTERIOR_SUBTILE_POSITIONS.exposed_sides.top
    elif proximity.is_bottom_neighbor_exposed_at_bottom:
        if proximity.is_left_neighbor_exposed_at_left:
            if proximity.is_right_neighbor_exposed_at_right:
                return INTERIOR_SUBTILE_POSITIONS.exposed_sides.bottom_left_right
            else:
                if proximity.is_top_right_neighbor_exposed_at_top_right:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.bottom_left_sides_top_right_corner
                else:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_sides.bottom_left
        elif proximity.is_right_neighbor_exposed_at_right:
            if proximity.is_top_left_neighbor_exposed_at_top_left:
                return INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.bottom_right_sides_top_left_corner
            else:
                return INTERIOR_SUBTILE_POSITIONS.exposed_sides.bottom_right
        else:
            if proximity.is_top_left_neighbor_exposed_at_top_left:
                if proximity.is_top_right_neighbor_exposed_at_top_right:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.bottom_side_top_left_top_right_corners
                else:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.bottom_side_top_left_corner
            elif proximity.is_top_right_neighbor_exposed_at_top_right:
                return INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.bottom_side_top_right_corner
            else:
                return INTERIOR_SUBTILE_POSITIONS.exposed_sides.bottom
    elif proximity.is_left_neighbor_exposed_at_left:
        if proximity.is_right_neighbor_exposed_at_right:
            return INTERIOR_SUBTILE_POSITIONS.exposed_sides.left_right
        else:
            if proximity.is_top_right_neighbor_exposed_at_top_right:
                if proximity.is_bottom_right_neighbor_exposed_at_bottom_right:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.left_side_top_right_bottom_right_corners
                else:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.left_side_top_right_corner
            elif proximity.is_bottom_right_neighbor_exposed_at_bottom_right:
                return INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.left_side_bottom_right_corner
            else:
                return INTERIOR_SUBTILE_POSITIONS.exposed_sides.left
    elif proximity.is_right_neighbor_exposed_at_right:
            if proximity.is_top_left_neighbor_exposed_at_top_left:
                if proximity.is_bottom_left_neighbor_exposed_at_bottom_left:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.right_side_top_left_bottom_left_corners
                else:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.right_side_top_left_corner
            elif proximity.is_bottom_left_neighbor_exposed_at_bottom_left:
                return INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.right_side_bottom_left_corner
            else:
                return INTERIOR_SUBTILE_POSITIONS.exposed_sides.right
    else:
        if proximity.is_top_left_neighbor_exposed_at_top_left:
            if proximity.is_top_right_neighbor_exposed_at_top_right:
                if proximity.is_bottom_left_neighbor_exposed_at_bottom_left:
                    if proximity.is_bottom_right_neighbor_exposed_at_bottom_right:
                        return INTERIOR_SUBTILE_POSITIONS.exposed_corners.all
                    else:
                        return INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_top_right_bottom_left
                elif proximity.is_bottom_right_neighbor_exposed_at_bottom_right:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_top_right_bottom_right
                else:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_top_right
            elif proximity.is_bottom_left_neighbor_exposed_at_bottom_left:
                if proximity.is_bottom_right_neighbor_exposed_at_bottom_right:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_bottom_left_bottom_right
                else:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_bottom_left
            elif proximity.is_bottom_right_neighbor_exposed_at_bottom_right:
                return INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_bottom_right
            else:
                return INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left
        elif proximity.is_top_right_neighbor_exposed_at_top_right:
            if proximity.is_bottom_left_neighbor_exposed_at_bottom_left:
                if proximity.is_bottom_right_neighbor_exposed_at_bottom_right:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_right_bottom_left_bottom_right
                else:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_right_bottom_left
            elif proximity.is_bottom_right_neighbor_exposed_at_bottom_right:
                return INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_right_bottom_right
            else:
                return INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_right
        elif proximity.is_bottom_left_neighbor_exposed_at_bottom_left:
            if proximity.is_bottom_right_neighbor_exposed_at_bottom_right:
                return INTERIOR_SUBTILE_POSITIONS.exposed_corners.bottom_left_bottom_right
            else:
                return INTERIOR_SUBTILE_POSITIONS.exposed_corners.bottom_left
        elif proximity.is_bottom_right_neighbor_exposed_at_bottom_right:
            return INTERIOR_SUBTILE_POSITIONS.exposed_corners.bottom_right
        else:
            return INTERIOR_SUBTILE_POSITIONS.exposed_sides.none


func _choose_45_degree_subtile(proximity: CellProximity) -> Vector2:
    # FIXME: LEFT OFF HERE: -----------------------------------
    return Vector2.INF


func _choose_27_degree_subtile(proximity: CellProximity) -> Vector2:
    # FIXME: LEFT OFF HERE: -----------------------------------
    return Vector2.INF


# FIXME: -------- How are bitmask optional bits handled?
func get_cell_bitmask(
        cell_position: Vector2,
        tile_map: TileMap) -> int:
    var tile_id := tile_map.get_cellv(cell_position)
    if tile_id == TileMap.INVALID_CELL:
        return INVALID_BITMASK
    
    var tile_mode := tile_get_tile_mode(tile_id)
    if tile_mode != AUTO_TILE:
        return INVALID_BITMASK
    
    var subtile_position := tile_map.get_cell_autotile_coord(
            cell_position.x, cell_position.y)
    
    return autotile_get_bitmask(tile_id, subtile_position)


func get_angle_type_from_tile_id(tile_id: int) -> int:
    match tile_id:
        tile_id_for_angle_a90:
            return CellAngleType.A90
        tile_id_for_angle_a45:
            return CellAngleType.A45
        tile_id_for_angle_a27:
            return CellAngleType.A27
        TileMap.INVALID_CELL:
            return CellAngleType.EMPTY
        _:
            return CellAngleType.UNKNOWN
