tool
class_name SquirrelAwayTileSetWithManyAngles
extends SurfacesTileSet


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
}


func _init().(_PROPERTIES_MANIFEST) -> void:
    pass


func _is_tile_bound( \
        drawn_id: int, \
        neighbor_id: int) -> bool:
    if neighbor_id == TileMap.INVALID_CELL:
        return false
    
    return true


func _forward_subtile_selection(
        autotile_id: int,
        bitmask: int,
        tile_map: Object,
        cell_position: Vector2):
    if bitmask != FULL_BITMASK_3x3:
        # NOTE:
        # - Not returning any value here is terrible.
        # - However, apparently Godot doesn't support returning any actual
        #   values that would indicate redirecting back to the default behavior.
        return
    
    var top_left_neighbor_bitmask := get_cell_bitmask(
            cell_position + Vector2(-1, -1),
            tile_map)
    var top_neighbor_bitmask := get_cell_bitmask(
            cell_position + Vector2(0, -1),
            tile_map)
    var top_right_neighbor_bitmask := get_cell_bitmask(
            cell_position + Vector2(1, -1),
            tile_map)
    var left_neighbor_bitmask := get_cell_bitmask(
            cell_position + Vector2(-1, 0),
            tile_map)
    var right_neighbor_bitmask := get_cell_bitmask(
            cell_position + Vector2(1, 0),
            tile_map)
    var bottom_left_neighbor_bitmask := get_cell_bitmask(
            cell_position + Vector2(-1, 1),
            tile_map)
    var bottom_neighbor_bitmask := get_cell_bitmask(
            cell_position + Vector2(0, 1),
            tile_map)
    var bottom_right_neighbor_bitmask := get_cell_bitmask(
            cell_position + Vector2(1, 1),
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
    
    if is_top_neighbor_exposed_at_top:
        if is_bottom_neighbor_exposed_at_bottom:
            if is_left_neighbor_exposed_at_left:
                if is_right_neighbor_exposed_at_right:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_sides.all
                else:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_sides.top_bottom_left
            elif is_right_neighbor_exposed_at_right:
                return INTERIOR_SUBTILE_POSITIONS.exposed_sides.top_bottom_right
            else:
                return INTERIOR_SUBTILE_POSITIONS.exposed_sides.top_bottom
        elif is_left_neighbor_exposed_at_left:
            if is_right_neighbor_exposed_at_right:
                return INTERIOR_SUBTILE_POSITIONS.exposed_sides.top_left_right
            else:
                return INTERIOR_SUBTILE_POSITIONS.exposed_sides.top_left
        elif is_right_neighbor_exposed_at_right:
            return INTERIOR_SUBTILE_POSITIONS.exposed_sides.top_right
        else:
            return INTERIOR_SUBTILE_POSITIONS.exposed_sides.top
    elif is_bottom_neighbor_exposed_at_bottom:
        if is_left_neighbor_exposed_at_left:
            if is_right_neighbor_exposed_at_right:
                return INTERIOR_SUBTILE_POSITIONS.exposed_sides.bottom_left_right
            else:
                return INTERIOR_SUBTILE_POSITIONS.exposed_sides.bottom_left
        elif is_right_neighbor_exposed_at_right:
            return INTERIOR_SUBTILE_POSITIONS.exposed_sides.bottom_right
        else:
            return INTERIOR_SUBTILE_POSITIONS.exposed_sides.bottom
    elif is_left_neighbor_exposed_at_left:
        if is_right_neighbor_exposed_at_right:
            return INTERIOR_SUBTILE_POSITIONS.exposed_sides.left_right
        else:
            return INTERIOR_SUBTILE_POSITIONS.exposed_sides.left
    elif is_right_neighbor_exposed_at_right:
            return INTERIOR_SUBTILE_POSITIONS.exposed_sides.right
    else:
        if is_top_left_neighbor_exposed_at_top_left:
            if is_top_right_neighbor_exposed_at_top_right:
                if is_bottom_left_neighbor_exposed_at_bottom_left:
                    if is_bottom_right_neighbor_exposed_at_bottom_right:
                        return INTERIOR_SUBTILE_POSITIONS.exposed_corners.all
                    else:
                        return INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_top_right_bottom_left
                elif is_bottom_right_neighbor_exposed_at_bottom_right:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_top_right_bottom_right
                else:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_top_right
            elif is_bottom_left_neighbor_exposed_at_bottom_left:
                if is_bottom_right_neighbor_exposed_at_bottom_right:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_bottom_left_bottom_right
                else:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_bottom_left
            elif is_bottom_right_neighbor_exposed_at_bottom_right:
                return INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_bottom_right
            else:
                return INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left
        elif is_top_right_neighbor_exposed_at_top_right:
            if is_bottom_left_neighbor_exposed_at_bottom_left:
                if is_bottom_right_neighbor_exposed_at_bottom_right:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_right_bottom_left_bottom_right
                else:
                    return INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_right_bottom_left
            elif is_bottom_right_neighbor_exposed_at_bottom_right:
                return INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_right_bottom_right
            else:
                return INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_right
        elif is_bottom_left_neighbor_exposed_at_bottom_left:
            if is_bottom_right_neighbor_exposed_at_bottom_right:
                return INTERIOR_SUBTILE_POSITIONS.exposed_corners.bottom_left_bottom_right
            else:
                return INTERIOR_SUBTILE_POSITIONS.exposed_corners.bottom_left
        elif is_bottom_right_neighbor_exposed_at_bottom_right:
            return INTERIOR_SUBTILE_POSITIONS.exposed_corners.bottom_right
        else:
            return INTERIOR_SUBTILE_POSITIONS.exposed_sides.none


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
