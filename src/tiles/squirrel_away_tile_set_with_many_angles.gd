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

const TILE_WITH_SEPARATED_DEPTHS_NAME := "tiles_with_separated_depths"

const FULLY_INTERIOR_SUBTILE_POSITION := Vector2(1,5)

# NOTE: These positions need to be kept in-sync with the corresponding tile-set
#       image.
const A90_EXTERIOR_SUBTILE_POSITIONS := {
    floor_left_wall_right_wall = Vector2(0,0),
    left_wall_right_wall = Vector2(0,1),
    left_wall_right_wall_ceiling = Vector2(0,2),
    all = Vector2(0,3),
    floor_right_wall_ceiling = Vector2(1,3),
    floor_ceiling = Vector2(2,3),
    floor_left_wall_ceiling = Vector2(3,3),
    floor_right_wall_sides_bottom_right_corner = Vector2(1,0),
    floor_side_bottom_left_bottom_right_corners = Vector2(2,0),
    floor_left_wall_sides_bottom_left_corner = Vector2(3,0),
    right_wall_side_top_right_bottom_right_corners = Vector2(1,1),
    all_corners = Vector2(2,1),
    left_wall_side_top_left_bottom_left_corners = Vector2(3,1),
    right_wall_ceiling_sides_top_right_corner = Vector2(1,2),
    ceiling_side_top_left_top_right_corners = Vector2(2,2),
    left_wall_ceiling_sides_top_left_corner = Vector2(3,2),
    top_right_bottom_left_bottom_right_corners = Vector2(4,0),
    floor_side_bottom_left_corner = Vector2(5,0),
    floor_side_bottom_right_corner = Vector2(6,0),
    top_left_bottom_left_bottom_right_corners = Vector2(7,0),
    right_wall_side_top_right_corner = Vector2(4,1),
    top_left_corner = Vector2(5,1),
    top_right_corner = Vector2(6,1),
    left_wall_side_top_left_corner = Vector2(7,1),
    right_wall_side_bottom_right_corner = Vector2(4,2),
    bottom_left_corner = Vector2(5,2),
    bottom_right_corner = Vector2(6,2),
    left_wall_side_bottom_left_corner = Vector2(7,2),
    top_left_top_right_bottom_right_corners = Vector2(4,3),
    ceiling_side_top_left_corner = Vector2(5,3),
    ceiling_side_top_right_corner = Vector2(6,3),
    top_left_top_right_bottom_left_corners = Vector2(7,3),
    floor_right_wall = Vector2(8,0),
    top_left_top_right_corners = Vector2(9,0),
    floor = Vector2(10,0),
    floor_left_wall = Vector2(11,0),
    right_wall = Vector2(8,1),
    top_left_bottom_right_corners = Vector2(9,1),
    top_right_bottom_right_corners = Vector2(11,1),
    top_left_bottom_left_corners = Vector2(8,2),
    none = Vector2(9,2),
    top_right_bottom_left_corners = Vector2(10,2),
    left_wall = Vector2(11,2),
    right_wall_ceiling = Vector2(8,3),
    ceiling = Vector2(9,3),
    bottom_left_bottom_right_corners = Vector2(10,3),
    left_wall_ceiling = Vector2(11,3),
}

# NOTE: These positions need to be kept in-sync with the corresponding tile-set
#       image.
const A90_INTERIOR_SUBTILE_POSITIONS := {
    exposed_sides = {
        top_left = Vector2(0,4),
        top = Vector2(1,4),
        top_right = Vector2(2,4),
        left = Vector2(0,5),
        none = FULLY_INTERIOR_SUBTILE_POSITION,
        right = Vector2(2,5),
        bottom_left = Vector2(0,6),
        bottom = Vector2(1,6),
        bottom_right = Vector2(2,6),
        left_right = Vector2(3,4),
        bottom_left_right = Vector2(4,4),
        top_bottom = Vector2(5,4),
        top_bottom_right = Vector2(3,5),
        all = Vector2(4,5),
        top_bottom_left = Vector2(5,5),
        top_left_right = Vector2(4,6),
    },
    exposed_corners = {
        bottom_right = Vector2(6,4),
        bottom_left_bottom_right = Vector2(7,4),
        bottom_left = Vector2(8,4),
        top_right_bottom_right = Vector2(6,5),
        all = Vector2(7,5),
        top_left_bottom_left = Vector2(8,5),
        top_right = Vector2(6,6),
        top_left_top_right = Vector2(7,6),
        top_left = Vector2(8,6),
        top_right_bottom_left_bottom_right = Vector2(9,4),
        top_left_bottom_left_bottom_right = Vector2(10,4),
        top_left_top_right_bottom_right = Vector2(9,5),
        top_left_top_right_bottom_left = Vector2(10,5),
        top_right_bottom_left = Vector2(9,6),
        top_left_bottom_right = Vector2(10,6),
    },
    exposed_sides_and_corners = {
        top_left_sides_bottom_right_corner = Vector2(0,7),
        top_right_sides_bottom_left_corner = Vector2(1,7),
        bottom_left_sides_top_right_corner = Vector2(0,8),
        bottom_right_sides_top_left_corner = Vector2(1,8),
        top_side_bottom_right_corner = Vector2(2,7),
        top_side_bottom_left_bottom_right_corners = Vector2(3,7),
        top_side_bottom_left_corner = Vector2(4,7),
        bottom_side_top_right_corner = Vector2(2,8),
        bottom_side_top_left_top_right_corners = Vector2(3,8),
        bottom_side_top_left_corner = Vector2(4,8),
        left_side_bottom_right_corner = Vector2(5,7),
        left_side_top_right_corner = Vector2(5,8),
        left_side_top_right_bottom_right_corners = Vector2(7,7),
        right_side_bottom_left_corner = Vector2(6,7),
        right_side_top_left_corner = Vector2(6,8),
        right_side_top_left_bottom_left_corners = Vector2(8,7),
    },
}

# NOTE: These positions need to be kept in-sync with the corresponding tile-set
#       image.
const A45_EXTERIOR_SUBTILE_POSITIONS := {
    floors = {
        pos = Vector2(0,9),
        pos_with_cutout_corner = Vector2(0,11),
        neg = Vector2(3,9),
        neg_with_cutout_corner = Vector2(1,11),
        pos_to_right_neg = Vector2(2,11),
        neg_to_left_pos = Vector2(3,11),
        pos_to_bottom_ceiling = Vector2(4,11),
        neg_to_bottom_ceiling = Vector2(5,11),
        pos_to_right_neg_and_bottom_ceiling = Vector2(6,11),
        neg_to_left_pos_and_bottom_ceiling = Vector2(7,11),
    },
    ceilings = {
        pos = Vector2(3,10),
        pos_with_cutout_corner = Vector2(1,12),
        neg = Vector2(0,10),
        neg_with_cutout_corner = Vector2(0,12),
        neg_to_right_pos = Vector2(2,12),
        pos_to_left_neg = Vector2(3,12),
        neg_to_top_floor = Vector2(4,12),
        pos_to_top_floor = Vector2(5,12),
        neg_to_right_pos_and_top_floor = Vector2(6,12),
        pos_to_left_neg_and_top_floor = Vector2(7,12),
    },
    cutout_corners = {
        top_left_top_right = Vector2(4,9),
        bottom_left_bottom_right = Vector2(4,10),
        top_right_bottom_right = Vector2(5,9),
        top_left_bottom_left = Vector2(6,9),
        top_left_bottom_right = Vector2(5,10),
        top_right_bottom_left = Vector2(6,10),
        top_right_bottom_left_bottom_right = Vector2(7,9),
        top_left_bottom_left_bottom_right = Vector2(8,9),
        top_left_top_right_bottom_right = Vector2(7,10),
        top_left_top_right_bottom_left = Vector2(8,10),
        all = Vector2(9,9),
        top_left = {
            not_exposed = Vector2(1,9),
            exposed_a90_bottom_right_corner = Vector2(0,32),
            exposed_a90_right_side = Vector2(2,32),
            exposed_a90_bottom_side = Vector2(4,32),
            exposed_a90_bottom_right_sides = Vector2(6,32),
            exposed_a45_bottom_right = Vector2(8,32),
        },
        top_right = {
            not_exposed = Vector2(2,9),
            exposed_a90_bottom_left_corner = Vector2(1,32),
            exposed_a90_left_side = Vector2(3,32),
            exposed_a90_bottom_side = Vector2(5,32),
            exposed_a90_bottom_left_sides = Vector2(7,32),
            exposed_a45_bottom_left = Vector2(9,32),
        },
        bottom_left = {
            not_exposed = Vector2(1,10),
            exposed_a90_top_right_corner = Vector2(0,33),
            exposed_a90_right_side = Vector2(2,33),
            exposed_a90_top_side = Vector2(4,33),
            exposed_a90_top_right_sides = Vector2(6,33),
            exposed_a45_top_right = Vector2(8,33),
        },
        bottom_right = {
            not_exposed = Vector2(2,10),
            exposed_a90_top_left_corner = Vector2(1,33),
            exposed_a90_left_side = Vector2(3,33),
            exposed_a90_top_side = Vector2(5,33),
            exposed_a90_top_left_sides = Vector2(7,33),
            exposed_a45_top_left = Vector2(9,33),
        },
    },
    caps = {
        top = {
            with_bottom_cap = Vector2(8,11),
            with_bottom_a45_ceiling_pos = Vector2(9,11),
            with_bottom_a45_ceiling_neg = Vector2(10,11),
            with_bottom_floors = Vector2(11,11),
        },
        bottom = {
            with_top_cap = Vector2(8,12),
            with_top_a45_floor_pos = Vector2(9,12),
            with_top_a45_floor_neg = Vector2(10,12),
            with_top_ceilings = Vector2(11,12),
        },
        left = Vector2(10,10),
        right = Vector2(11,10),
    },
}

# NOTE: These positions need to be kept in-sync with the corresponding tile-set
#       image.
const A45_INTERIOR_SUBTILE_POSITIONS := {
    exposed_corners = {
        bottom_right = Vector2(0,13),
        bottom_left = Vector2(1,13),
        top_right = Vector2(0,14),
        top_left = Vector2(1,14),
        bottom_left_bottom_right = Vector2(2,13),
        top_left_bottom_left = Vector2(3,13),
        top_right_bottom_left = Vector2(4,13),
        top_left_top_right = Vector2(2,14),
        top_right_bottom_right = Vector2(3,14),
        top_left_bottom_right = Vector2(4,14),
        top_right_bottom_left_bottom_right = Vector2(5,13),
        top_left_bottom_left_bottom_right = Vector2(6,13),
        top_left_top_right_bottom_right = Vector2(5,14),
        top_left_top_right_bottom_left = Vector2(6,14),
        all = Vector2(7,13),
        none = FULLY_INTERIOR_SUBTILE_POSITION,
    },
}

# NOTE: These positions need to be kept in-sync with the corresponding tile-set
#       image.
const A90_A45_EXTERIOR_JOINS := {
    floors = {
        left_45_convex = {
            a90 = Vector2(3,15),
            a45 = Vector2(2,15),
        },
        right_45_convex = {
            a90 = Vector2(4,15),
            a45 = Vector2(5,15),
        },
        left_45_right_45_convex = Vector2(7,15),
        left_45_convex_to_wall = Vector2(6,15),
        right_45_convex_to_wall = Vector2(8,15),
        left_45_concave = Vector2(4,18),
        right_45_concave = Vector2(5,18),
        left_45_convex_acute = Vector2(2,19),
        right_45_convex_acute = Vector2(3,19),
        left_45_concave_acute = Vector2(9,16),
        right_45_concave_acute = Vector2(10,16),
    },
    ceilings = {
        left_45_convex = {
            a90 = Vector2(3,16),
            a45 = Vector2(2,16),
        },
        right_45_convex = {
            a90 = Vector2(4,16),
            a45 = Vector2(5,16),
        },
        left_45_right_45_convex = Vector2(7,17),
        left_45_convex_to_wall = Vector2(6,17),
        right_45_convex_to_wall = Vector2(8,17),
        left_45_concave = Vector2(4,17),
        right_45_concave = Vector2(5,17),
        left_45_convex_acute = Vector2(2,20),
        right_45_convex_acute = Vector2(3,20),
        left_45_concave_acute = Vector2(9,15),
        right_45_concave_acute = Vector2(10,15),
    },
    left_walls = {
        top_45_convex = {
            a90 = Vector2(1,16),
            a45 = Vector2(1,15),
        },
        bottom_45_convex = {
            a90 = Vector2(1,17),
            a45 = Vector2(1,18),
        },
        top_45_bottom_45_convex = Vector2(8,16),
        top_45_concave = Vector2(3,17),
        bottom_45_concave = Vector2(3,18),
        top_45_convex_acute = Vector2(0,19),
        bottom_45_convex_acute = Vector2(0,20),
        top_45_concave_acute = Vector2(10,15),
        bottom_45_concave_acute = Vector2(10,16),
    },
    right_walls = {
        top_45_convex = {
            a90 = Vector2(0,16),
            a45 = Vector2(0,15),
        },
        bottom_45_convex = {
            a90 = Vector2(0,17),
            a45 = Vector2(0,18),
        },
        top_45_bottom_45_convex = Vector2(6,16),
        top_45_concave = Vector2(2,17),
        bottom_45_concave = Vector2(2,18),
        top_45_convex_acute = Vector2(1,19),
        bottom_45_convex_acute = Vector2(1,20),
        top_45_concave_acute = Vector2(9,15),
        bottom_45_concave_acute = Vector2(9,16),
    },
    outer_a45s_with_cutout_corners = {
        a90 = {
            floor_pos = Vector2(4,19),
            floor_neg = Vector2(5,19),
            ceiling_pos = Vector2(4,20),
            ceiling_neg = Vector2(5,20),
        },
        a90_vertical_to_a45 = {
            floor_pos = Vector2(6,19),
            floor_neg = Vector2(7,19),
            ceiling_pos = Vector2(6,20),
            ceiling_neg = Vector2(7,20),
        },
        a90_horizontal_to_a45 = {
            floor_pos = Vector2(8,19),
            floor_neg = Vector2(9,19),
            ceiling_pos = Vector2(8,20),
            ceiling_neg = Vector2(9,20),
        },
    },
    a90_sides_with_cutout_corners = {
        floor_and_left_wall = {
            a45 = Vector2(0,22),
            a90_vertical_to_a45 = Vector2(2,22),
            a90_horizontal_to_a45 = Vector2(4,22),
        },
        floor_and_right_wall = {
            a45 = Vector2(1,22),
            a90_vertical_to_a45 = Vector2(3,22),
            a90_horizontal_to_a45 = Vector2(5,22),
        },
        ceiling_and_left_wall = {
            a45 = Vector2(0,23),
            a90_vertical_to_a45 = Vector2(2,23),
            a90_horizontal_to_a45 = Vector2(4,23),
        },
        ceiling_and_right_wall = {
            a45 = Vector2(1,23),
            a90_vertical_to_a45 = Vector2(3,23),
            a90_horizontal_to_a45 = Vector2(5,23),
        },
        floors = {
            bottom_left = Vector2(3,24),
            bottom_right = Vector2(2,24),
            both = Vector2(7,22),
            to_left_a45 = {
                bottom_left = Vector2(10,24),
                bottom_right = Vector2(8,24),
                both = Vector2(10,22),
            },
            to_right_a45 = {
                bottom_left = Vector2(9,24),
                bottom_right = Vector2(11,24),
                both = Vector2(11,22),
            },
            to_left_and_right_a45 = {
                bottom_left = Vector2(2,26),
                bottom_right = Vector2(0,26),
                both = Vector2(1,26),
            },
        },
        ceilings = {
            top_left = Vector2(3,25),
            top_right = Vector2(2,25),
            both = Vector2(6,23),
            to_left_a45 = {
                top_left = Vector2(10,25),
                top_right = Vector2(8,25),
                both = Vector2(10,23),
            },
            to_right_a45 = {
                top_left = Vector2(9,25),
                top_right = Vector2(11,25),
                both = Vector2(11,23),
            },
            to_left_and_right_a45 = {
                top_left = Vector2(5,26),
                top_right = Vector2(3,26),
                both = Vector2(4,26),
            },
        },
        left_walls = {
            top_left = Vector2(1,25),
            bottom_left = Vector2(1,24),
            both = Vector2(7,23),
            to_top_a45 = {
                top_left = Vector2(7,24),
                bottom_left = Vector2(5,24),
                both = Vector2(9,22),
            },
            to_bottom_a45 = {
                top_left = Vector2(5,25),
                bottom_left = Vector2(7,25),
                both = Vector2(9,23),
            },
            to_top_and_bottom_a45 = {
                top_left = Vector2(11,26),
                bottom_left = Vector2(9,26),
                both = Vector2(10,26),
            },
        },
        right_walls = {
            top_right = Vector2(0,25),
            bottom_right = Vector2(0,24),
            both = Vector2(6,22),
            to_top_a45 = {
                top_right = Vector2(6,24),
                bottom_right = Vector2(4,24),
                both = Vector2(8,22),
            },
            to_bottom_a45 = {
                top_right = Vector2(4,25),
                bottom_right = Vector2(6,25),
                both = Vector2(8,23),
            },
            to_top_and_bottom_a45 = {
                top_right = Vector2(6,26),
                bottom_right = Vector2(8,26),
                both = Vector2(7,26),
            },
        },
    },
}

# NOTE: These positions need to be kept in-sync with the corresponding tile-set
#       image.
const A90_A45_INTERIOR_JOINS := {
    # FIXME: LEFT OFF HERE: ----------------------------------------
    floors = {
    },
    ceilings = {
    },
    left_walls = {
    },
    right_walls = {
    },
}

var tile_id_for_angle_a90: int
var tile_id_for_angle_a45: int
var tile_id_for_angle_a27: int


func _init().(_PROPERTIES_MANIFEST) -> void:
    tile_id_for_angle_a90 = find_tile_by_name(TILE_NAME_FOR_ANGLE_A90)
    assert(tile_id_for_angle_a90 != TileMap.INVALID_CELL)
    tile_id_for_angle_a45 = find_tile_by_name(TILE_NAME_FOR_ANGLE_A45)
    assert(tile_id_for_angle_a45 != TileMap.INVALID_CELL)
    tile_id_for_angle_a27 = find_tile_by_name(TILE_NAME_FOR_ANGLE_A27)
    assert(tile_id_for_angle_a27 != TileMap.INVALID_CELL)


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
    
    var subtile_position :=  Vector2.INF
    match proximity.angle_type:
        CellAngleType.A90:
            if proximity.is_internal:
                subtile_position = _choose_90_degree_interior_subtile(proximity)
            else:
                subtile_position = _choose_90_degree_exterior_subtile(proximity)
        CellAngleType.A45:
            if proximity.is_internal:
                subtile_position = _choose_45_degree_interior_subtile(proximity)
            else:
                subtile_position = _choose_45_degree_exterior_subtile(proximity)
        CellAngleType.A27:
            if proximity.is_internal:
                subtile_position = _choose_27_degree_interior_subtile(proximity)
            else:
                subtile_position = _choose_27_degree_exterior_subtile(proximity)
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
        position: Vector2) -> CellProximity:
    var top_left_neighbor_position := position + Vector2(-1, -1)
    var top_neighbor_position := position + Vector2(0, -1)
    var top_right_neighbor_position := position + Vector2(1, -1)
    var left_neighbor_position := position + Vector2(-1, 0)
    var right_neighbor_position := position + Vector2(1, 0)
    var bottom_left_neighbor_position := position + Vector2(-1, 1)
    var bottom_neighbor_position := position + Vector2(0, 1)
    var bottom_right_neighbor_position := position + Vector2(1, 1)
    
    var top_left_neighbor_tile_id := tile_map.get_cellv(top_left_neighbor_position)
    var top_neighbor_tile_id := tile_map.get_cellv(top_neighbor_position)
    var top_right_neighbor_tile_id := tile_map.get_cellv(top_right_neighbor_position)
    var left_neighbor_tile_id := tile_map.get_cellv(left_neighbor_position)
    var right_neighbor_tile_id := tile_map.get_cellv(right_neighbor_position)
    var bottom_left_neighbor_tile_id := tile_map.get_cellv(bottom_left_neighbor_position)
    var bottom_neighbor_tile_id := tile_map.get_cellv(bottom_neighbor_position)
    var bottom_right_neighbor_tile_id := tile_map.get_cellv(bottom_right_neighbor_position)
    
    var angle_type := get_angle_type_from_tile_id(tile_id)
    var top_left_neighbor_angle_type := \
            get_angle_type_from_tile_id(top_left_neighbor_tile_id)
    var top_neighbor_angle_type := \
            get_angle_type_from_tile_id(top_neighbor_tile_id)
    var top_right_neighbor_angle_type := \
            get_angle_type_from_tile_id(top_right_neighbor_tile_id)
    var left_neighbor_angle_type := \
            get_angle_type_from_tile_id(left_neighbor_tile_id)
    var right_neighbor_angle_type := \
            get_angle_type_from_tile_id(right_neighbor_tile_id)
    var bottom_left_neighbor_angle_type := \
            get_angle_type_from_tile_id(bottom_left_neighbor_tile_id)
    var bottom_neighbor_angle_type := \
            get_angle_type_from_tile_id(bottom_neighbor_tile_id)
    var bottom_right_neighbor_angle_type := \
            get_angle_type_from_tile_id(bottom_right_neighbor_tile_id)
    
    bitmask = get_cell_actual_bitmask(
            position,
            tile_map)
    var top_left_neighbor_bitmask := get_cell_actual_bitmask(
            top_left_neighbor_position,
            tile_map)
    var top_neighbor_bitmask := get_cell_actual_bitmask(
            top_neighbor_position,
            tile_map)
    var top_right_neighbor_bitmask := get_cell_actual_bitmask(
            top_right_neighbor_position,
            tile_map)
    var left_neighbor_bitmask := get_cell_actual_bitmask(
            left_neighbor_position,
            tile_map)
    var right_neighbor_bitmask := get_cell_actual_bitmask(
            right_neighbor_position,
            tile_map)
    var bottom_left_neighbor_bitmask := get_cell_actual_bitmask(
            bottom_left_neighbor_position,
            tile_map)
    var bottom_neighbor_bitmask := get_cell_actual_bitmask(
            bottom_neighbor_position,
            tile_map)
    var bottom_right_neighbor_bitmask := get_cell_actual_bitmask(
            bottom_right_neighbor_position,
            tile_map)
    
    var proximity := CellProximity.new()
    proximity.position = position
    proximity.angle_type = angle_type
    proximity.bitmask = bitmask
    proximity.top_left_neighbor_angle_type = top_left_neighbor_angle_type
    proximity.top_neighbor_angle_type = top_neighbor_angle_type
    proximity.top_right_neighbor_angle_type = top_right_neighbor_angle_type
    proximity.left_neighbor_angle_type = left_neighbor_angle_type
    proximity.right_neighbor_angle_type = right_neighbor_angle_type
    proximity.bottom_left_neighbor_angle_type = bottom_left_neighbor_angle_type
    proximity.bottom_neighbor_angle_type = bottom_neighbor_angle_type
    proximity.bottom_right_neighbor_angle_type = bottom_right_neighbor_angle_type
    proximity.top_left_neighbor_bitmask = top_left_neighbor_bitmask
    proximity.top_neighbor_bitmask = top_neighbor_bitmask
    proximity.top_right_neighbor_bitmask = top_right_neighbor_bitmask
    proximity.left_neighbor_bitmask = left_neighbor_bitmask
    proximity.right_neighbor_bitmask = right_neighbor_bitmask
    proximity.bottom_left_neighbor_bitmask = bottom_left_neighbor_bitmask
    proximity.bottom_neighbor_bitmask = bottom_neighbor_bitmask
    proximity.bottom_right_neighbor_bitmask = bottom_right_neighbor_bitmask
    
    return proximity


# FIXME: LEFT OFF HERE: ------------------------------------------------
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
# - PROBLEM:
#   - Will involve a lot of redundant art, shape configuration, and
#     subtile-selection-join-encoding for all of the join and
#     interior-transition subtiles.
# - SOLUTION:
#   - Only include art, shape-configuration, and join-encoding for common cases.
#   - For uncommon cases, rely on one-off additions and manual tile-placement,
#     as needed.


# NOTE: This assumes all neighbors are also 90-degrees.
func _choose_90_degree_exterior_subtile(proximity: CellProximity) -> Vector2:
    if proximity.is_exposed_at_top:
        if proximity.is_exposed_at_bottom:
            if proximity.is_exposed_at_left:
                if proximity.is_exposed_at_right:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.all
                else:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.floor_right_wall_ceiling
            elif proximity.is_exposed_at_right:
                return A90_EXTERIOR_SUBTILE_POSITIONS.floor_left_wall_ceiling
            else:
                return A90_EXTERIOR_SUBTILE_POSITIONS.floor_ceiling
        elif proximity.is_exposed_at_left:
            if proximity.is_exposed_at_right:
                return A90_EXTERIOR_SUBTILE_POSITIONS.floor_left_wall_right_wall
            else:
                return A90_EXTERIOR_SUBTILE_POSITIONS.floor_right_wall
        elif proximity.is_exposed_at_right:
            return A90_EXTERIOR_SUBTILE_POSITIONS.floor_left_wall
        else:
            return A90_EXTERIOR_SUBTILE_POSITIONS.floor
    elif proximity.is_exposed_at_bottom:
        if proximity.is_exposed_at_left:
            if proximity.is_exposed_at_right:
                return A90_EXTERIOR_SUBTILE_POSITIONS.left_wall_right_wall_ceiling
            else:
                return A90_EXTERIOR_SUBTILE_POSITIONS.right_wall_ceiling
        elif proximity.is_exposed_at_right:
            return A90_EXTERIOR_SUBTILE_POSITIONS.left_wall_ceiling
        else:
            return A90_EXTERIOR_SUBTILE_POSITIONS.ceiling
    elif proximity.is_exposed_at_left:
        if proximity.is_exposed_at_right:
            return A90_EXTERIOR_SUBTILE_POSITIONS.left_wall_right_wall
        else:
            return A90_EXTERIOR_SUBTILE_POSITIONS.right_wall
    elif proximity.is_exposed_at_right:
        return A90_EXTERIOR_SUBTILE_POSITIONS.left_wall
    else:
        if proximity.is_exposed_at_top_left:
            if proximity.is_exposed_at_top_right:
                if proximity.is_exposed_at_bottom_left:
                    if proximity.is_exposed_at_bottom_right:
                        return A90_EXTERIOR_SUBTILE_POSITIONS.all_corners
                    else:
                        return A90_EXTERIOR_SUBTILE_POSITIONS.top_left_top_right_bottom_left_corners
                elif proximity.is_exposed_at_bottom_right:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.top_left_top_right_bottom_right_corners
                else:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.top_left_top_right_corners
            elif proximity.is_exposed_at_bottom_left:
                if proximity.is_exposed_at_bottom_right:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.top_left_bottom_left_bottom_right_corners
                else:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.top_left_bottom_left_corners
            elif proximity.is_exposed_at_bottom_right:
                return A90_EXTERIOR_SUBTILE_POSITIONS.top_left_bottom_right_corners
            else:
                return A90_EXTERIOR_SUBTILE_POSITIONS.top_left_corner
        elif proximity.is_exposed_at_top_right:
            if proximity.is_exposed_at_bottom_left:
                if proximity.is_exposed_at_bottom_right:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.top_right_bottom_left_bottom_right_corners
                else:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.top_right_bottom_left_corners
            elif proximity.is_exposed_at_bottom_right:
                return A90_EXTERIOR_SUBTILE_POSITIONS.top_right_bottom_right_corners
            else:
                return A90_EXTERIOR_SUBTILE_POSITIONS.top_right_corner
        elif proximity.is_exposed_at_bottom_left:
            if proximity.is_exposed_at_bottom_right:
                return A90_EXTERIOR_SUBTILE_POSITIONS.bottom_left_bottom_right_corners
            else:
                return A90_EXTERIOR_SUBTILE_POSITIONS.bottom_left_corner
        elif proximity.is_exposed_at_bottom_right:
            return A90_EXTERIOR_SUBTILE_POSITIONS.bottom_right_corner
        else:
            return A90_EXTERIOR_SUBTILE_POSITIONS.none
    
    return Vector2.INF


# NOTE: This assumes all neighbors are also 90-degrees.
func _choose_90_degree_interior_subtile(proximity: CellProximity) -> Vector2:
    if proximity.is_top_neighbor_exposed_around_top:
        if proximity.is_bottom_neighbor_exposed_around_bottom:
            if proximity.is_left_neighbor_exposed_around_left:
                if proximity.is_right_neighbor_exposed_around_right:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.all
                else:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.top_bottom_left
            elif proximity.is_right_neighbor_exposed_around_right:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.top_bottom_right
            else:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.top_bottom
        elif proximity.is_left_neighbor_exposed_around_left:
            if proximity.is_right_neighbor_exposed_around_right:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.top_left_right
            else:
                if proximity.is_bottom_right_neighbor_exposed_around_bottom_right:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.top_left_sides_bottom_right_corner
                else:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.top_left
        elif proximity.is_right_neighbor_exposed_around_right:
            if proximity.is_bottom_left_neighbor_exposed_around_bottom_left:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.top_right_sides_bottom_left_corner
            else:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.top_right
        else:
            if proximity.is_bottom_left_neighbor_exposed_around_bottom_left:
                if proximity.is_bottom_right_neighbor_exposed_around_bottom_right:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.top_side_bottom_left_bottom_right_corners
                else:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.top_side_bottom_left_corner
            elif proximity.is_bottom_right_neighbor_exposed_around_bottom_right:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.top_side_bottom_right_corner
            else:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.top
    elif proximity.is_bottom_neighbor_exposed_around_bottom:
        if proximity.is_left_neighbor_exposed_around_left:
            if proximity.is_right_neighbor_exposed_around_right:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.bottom_left_right
            else:
                if proximity.is_top_right_neighbor_exposed_around_top_right:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.bottom_left_sides_top_right_corner
                else:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.bottom_left
        elif proximity.is_right_neighbor_exposed_around_right:
            if proximity.is_top_left_neighbor_exposed_around_top_left:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.bottom_right_sides_top_left_corner
            else:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.bottom_right
        else:
            if proximity.is_top_left_neighbor_exposed_around_top_left:
                if proximity.is_top_right_neighbor_exposed_around_top_right:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.bottom_side_top_left_top_right_corners
                else:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.bottom_side_top_left_corner
            elif proximity.is_top_right_neighbor_exposed_around_top_right:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.bottom_side_top_right_corner
            else:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.bottom
    elif proximity.is_left_neighbor_exposed_around_left:
        if proximity.is_right_neighbor_exposed_around_right:
            return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.left_right
        else:
            if proximity.is_top_right_neighbor_exposed_around_top_right:
                if proximity.is_bottom_right_neighbor_exposed_around_bottom_right:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.left_side_top_right_bottom_right_corners
                else:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.left_side_top_right_corner
            elif proximity.is_bottom_right_neighbor_exposed_around_bottom_right:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.left_side_bottom_right_corner
            else:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.left
    elif proximity.is_right_neighbor_exposed_around_right:
            if proximity.is_top_left_neighbor_exposed_around_top_left:
                if proximity.is_bottom_left_neighbor_exposed_around_bottom_left:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.right_side_top_left_bottom_left_corners
                else:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.right_side_top_left_corner
            elif proximity.is_bottom_left_neighbor_exposed_around_bottom_left:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.right_side_bottom_left_corner
            else:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.right
    else:
        if proximity.is_top_left_neighbor_exposed_around_top_left:
            if proximity.is_top_right_neighbor_exposed_around_top_right:
                if proximity.is_bottom_left_neighbor_exposed_around_bottom_left:
                    if proximity.is_bottom_right_neighbor_exposed_around_bottom_right:
                        return A90_INTERIOR_SUBTILE_POSITIONS.exposed_corners.all
                    else:
                        return A90_INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_top_right_bottom_left
                elif proximity.is_bottom_right_neighbor_exposed_around_bottom_right:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_top_right_bottom_right
                else:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_top_right
            elif proximity.is_bottom_left_neighbor_exposed_around_bottom_left:
                if proximity.is_bottom_right_neighbor_exposed_around_bottom_right:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_bottom_left_bottom_right
                else:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_bottom_left
            elif proximity.is_bottom_right_neighbor_exposed_around_bottom_right:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_bottom_right
            else:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left
        elif proximity.is_top_right_neighbor_exposed_around_top_right:
            if proximity.is_bottom_left_neighbor_exposed_around_bottom_left:
                if proximity.is_bottom_right_neighbor_exposed_around_bottom_right:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_right_bottom_left_bottom_right
                else:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_right_bottom_left
            elif proximity.is_bottom_right_neighbor_exposed_around_bottom_right:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_right_bottom_right
            else:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_right
        elif proximity.is_bottom_left_neighbor_exposed_around_bottom_left:
            if proximity.is_bottom_right_neighbor_exposed_around_bottom_right:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_corners.bottom_left_bottom_right
            else:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_corners.bottom_left
        elif proximity.is_bottom_right_neighbor_exposed_around_bottom_right:
            return A90_INTERIOR_SUBTILE_POSITIONS.exposed_corners.bottom_right
        else:
            return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.none
    
    return Vector2.INF


func _choose_45_degree_exterior_subtile(proximity: CellProximity) -> Vector2:
    if proximity.is_exposed_at_top:
        if proximity.is_exposed_at_bottom:
            if proximity.is_exposed_at_left:
                if proximity.is_exposed_at_right:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.all
                else:
                    # Left cap.
                    if proximity.is_right_neighbor_exposed_at_right:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.caps.left
                    elif proximity.is_exposed_at_top_right:
                        return A90_A45_EXTERIOR_JOINS.ceilings.left_45_convex_acute
                    elif proximity.is_exposed_at_bottom_right:
                        return A90_A45_EXTERIOR_JOINS.floors.left_45_convex_acute
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.caps.left
            elif proximity.is_exposed_at_right:
                # Right cap.
                if proximity.is_left_neighbor_exposed_at_left:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.caps.right
                elif proximity.is_exposed_at_top_left:
                    return A90_A45_EXTERIOR_JOINS.ceilings.right_45_convex_acute
                elif proximity.is_exposed_at_bottom_left:
                    return A90_A45_EXTERIOR_JOINS.floors.right_45_convex_acute
                else:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.caps.right
            else:
                return A90_EXTERIOR_SUBTILE_POSITIONS.floor_ceiling
        elif proximity.is_exposed_at_left:
            if proximity.is_exposed_at_right:
                # Top cap.
                if proximity.is_exposed_at_bottom_left:
                    if proximity.is_exposed_at_bottom_right:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.caps.top.with_bottom_cap
                    else:
                        if proximity.bottom_neighbor_angle_type == CellAngleType.A45 and \
                                proximity.is_bottom_neighbor_exposed_at_bottom:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.caps.top.with_bottom_a45_ceiling_neg
                        else:
                            return A90_A45_EXTERIOR_JOINS.right_walls.top_45_convex_acute
                elif proximity.is_exposed_at_bottom_right:
                    if proximity.bottom_neighbor_angle_type == CellAngleType.A45 and \
                            proximity.is_bottom_neighbor_exposed_at_bottom:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.caps.top.with_bottom_a45_ceiling_pos
                    else:
                        return A90_A45_EXTERIOR_JOINS.left_walls.top_45_convex_acute
                else:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.caps.top.with_bottom_floors
            else:
                if proximity.is_exposed_at_bottom_right:
                    if proximity.bottom_neighbor_angle_type == CellAngleType.A90:
                        if proximity.right_neighbor_angle_type == CellAngleType.A90:
                            return A90_A45_EXTERIOR_JOINS.outer_a45s_with_cutout_corners.a90.floor_pos
                        else:
                            return A90_A45_EXTERIOR_JOINS.outer_a45s_with_cutout_corners.a90_vertical_to_a45.floor_pos
                    elif proximity.right_neighbor_angle_type == CellAngleType.A90:
                        return A90_A45_EXTERIOR_JOINS.outer_a45s_with_cutout_corners.a90_horizontal_to_a45.floor_pos
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.floors.pos_with_cutout_corner
                else:
                    if proximity.right_neighbor_angle_type == CellAngleType.A90:
                        if proximity.bottom_neighbor_angle_type == CellAngleType.A90:
                            return A90_A45_EXTERIOR_JOINS.floors.left_45_convex_to_wall
                        else:
                            return A90_A45_EXTERIOR_JOINS.floors.left_45_convex.a45
                    elif proximity.bottom_neighbor_angle_type == CellAngleType.A90:
                        return A90_A45_EXTERIOR_JOINS.right_walls.top_45_convex.a45
                    elif proximity.is_exposed_at_bottom_left and \
                            proximity.is_bottom_neighbor_exposed_at_bottom:
                        if proximity.is_exposed_at_top_right and \
                                proximity.is_right_neighbor_exposed_at_right:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.floors.pos_to_right_neg_and_bottom_ceiling
                        else:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.floors.pos_to_bottom_ceiling
                    elif proximity.is_exposed_at_top_right and \
                            proximity.is_right_neighbor_exposed_at_right:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.floors.pos_to_right_neg
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.floors.pos
        elif proximity.is_exposed_at_right:
            if proximity.is_exposed_at_bottom_left:
                if proximity.bottom_neighbor_angle_type == CellAngleType.A90:
                    if proximity.left_neighbor_angle_type == CellAngleType.A90:
                        return A90_A45_EXTERIOR_JOINS.outer_a45s_with_cutout_corners.a90.floor_neg
                    else:
                        return A90_A45_EXTERIOR_JOINS.outer_a45s_with_cutout_corners.a90_vertical_to_a45.floor_neg
                elif proximity.left_neighbor_angle_type == CellAngleType.A90:
                    return A90_A45_EXTERIOR_JOINS.outer_a45s_with_cutout_corners.a90_horizontal_to_a45.floor_neg
                else:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.floors.neg_with_cutout_corner
            else:
                if proximity.left_neighbor_angle_type == CellAngleType.A90:
                    if proximity.bottom_neighbor_angle_type == CellAngleType.A90:
                        return A90_A45_EXTERIOR_JOINS.floors.right_45_convex_to_wall
                    else:
                        return A90_A45_EXTERIOR_JOINS.floors.right_45_convex.a45
                elif proximity.bottom_neighbor_angle_type == CellAngleType.A90:
                    return A90_A45_EXTERIOR_JOINS.left_walls.top_45_convex.a45
                elif proximity.is_exposed_at_bottom_right and \
                        proximity.is_bottom_neighbor_exposed_at_bottom:
                    if proximity.is_exposed_at_top_left and \
                            proximity.is_left_neighbor_exposed_at_left:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.floors.neg_to_left_pos_and_bottom_ceiling
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.floors.neg_to_bottom_ceiling
                elif proximity.is_exposed_at_top_left and \
                        proximity.is_left_neighbor_exposed_at_left:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.floors.neg_to_left_pos
                else:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.floors.neg
        else:
            return A90_EXTERIOR_SUBTILE_POSITIONS.floor
    elif proximity.is_exposed_at_bottom:
        if proximity.is_exposed_at_left:
            if proximity.is_exposed_at_right:
                # Bottom cap.
                if proximity.is_exposed_at_top_left:
                    if proximity.is_exposed_at_top_right:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.caps.bottom.with_top_cap
                    else:
                        if proximity.top_neighbor_angle_type == CellAngleType.A45 and \
                                proximity.is_top_neighbor_exposed_at_top:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.caps.bottom.with_top_a45_floor_pos
                        else:
                            return A90_A45_EXTERIOR_JOINS.right_walls.bottom_45_convex_acute
                elif proximity.is_exposed_at_top_right:
                    if proximity.top_neighbor_angle_type == CellAngleType.A45 and \
                            proximity.is_top_neighbor_exposed_at_top:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.caps.bottom.with_top_a45_floor_neg
                    else:
                        return A90_A45_EXTERIOR_JOINS.left_walls.bottom_45_convex_acute
                else:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.caps.bottom.with_top_ceilings
            else:
                if proximity.is_exposed_at_top_right:
                    if proximity.top_neighbor_angle_type == CellAngleType.A90:
                        if proximity.right_neighbor_angle_type == CellAngleType.A90:
                            return A90_A45_EXTERIOR_JOINS.outer_a45s_with_cutout_corners.a90.ceiling_neg
                        else:
                            return A90_A45_EXTERIOR_JOINS.outer_a45s_with_cutout_corners.a90_vertical_to_a45.ceiling_neg
                    elif proximity.right_neighbor_angle_type == CellAngleType.A90:
                        return A90_A45_EXTERIOR_JOINS.outer_a45s_with_cutout_corners.a90_horizontal_to_a45.ceiling_neg
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.ceilings.neg_with_cutout_corner
                else:
                    if proximity.right_neighbor_angle_type == CellAngleType.A90:
                        if proximity.top_neighbor_angle_type == CellAngleType.A90:
                            return A90_A45_EXTERIOR_JOINS.ceilings.left_45_convex_to_wall
                        else:
                            return A90_A45_EXTERIOR_JOINS.ceilings.left_45_convex.a45
                    elif proximity.top_neighbor_angle_type == CellAngleType.A90:
                        return A90_A45_EXTERIOR_JOINS.right_walls.bottom_45_convex.a45
                    elif proximity.is_exposed_at_top_left and \
                            proximity.is_top_neighbor_exposed_at_top:
                        if proximity.is_exposed_at_bottom_right and \
                                proximity.is_right_neighbor_exposed_at_right:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.ceilings.neg_to_right_pos_and_top_floor
                        else:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.ceilings.neg_to_top_floor
                    elif proximity.is_exposed_at_bottom_right and \
                            proximity.is_right_neighbor_exposed_at_right:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.ceilings.neg_to_right_pos
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.ceilings.neg
        elif proximity.is_exposed_at_right:
            if proximity.is_exposed_at_top_left:
                if proximity.top_neighbor_angle_type == CellAngleType.A90:
                    if proximity.left_neighbor_angle_type == CellAngleType.A90:
                        return A90_A45_EXTERIOR_JOINS.outer_a45s_with_cutout_corners.a90.ceiling_pos
                    else:
                        return A90_A45_EXTERIOR_JOINS.outer_a45s_with_cutout_corners.a90_vertical_to_a45.ceiling_pos
                elif proximity.left_neighbor_angle_type == CellAngleType.A90:
                    return A90_A45_EXTERIOR_JOINS.outer_a45s_with_cutout_corners.a90_horizontal_to_a45.ceiling_pos
                else:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.ceilings.pos_with_cutout_corner
            else:
                if proximity.left_neighbor_angle_type == CellAngleType.A90:
                    if proximity.top_neighbor_angle_type == CellAngleType.A90:
                        return A90_A45_EXTERIOR_JOINS.ceilings.right_45_convex_to_wall
                    else:
                        return A90_A45_EXTERIOR_JOINS.ceilings.right_45_convex.a45
                elif proximity.top_neighbor_angle_type == CellAngleType.A90:
                    return A90_A45_EXTERIOR_JOINS.left_walls.bottom_45_convex.a45
                elif proximity.is_exposed_at_top_right and \
                        proximity.is_top_neighbor_exposed_at_top:
                    if proximity.is_exposed_at_bottom_left and \
                            proximity.is_left_neighbor_exposed_at_left:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.ceilings.pos_to_left_neg_and_top_floor
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.ceilings.pos_to_top_floor
                elif proximity.is_exposed_at_bottom_left and \
                        proximity.is_left_neighbor_exposed_at_left:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.ceilings.pos_to_left_neg
                else:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.ceilings.pos
        else:
            return A90_EXTERIOR_SUBTILE_POSITIONS.ceiling
    elif proximity.is_exposed_at_left:
        if proximity.is_exposed_at_right:
            return A90_EXTERIOR_SUBTILE_POSITIONS.left_wall_right_wall
        else:
            return A90_EXTERIOR_SUBTILE_POSITIONS.right_wall
    elif proximity.is_exposed_at_right:
        return A90_EXTERIOR_SUBTILE_POSITIONS.left_wall
    else:
        if proximity.is_exposed_at_top_left:
            if proximity.is_exposed_at_top_right:
                if proximity.is_exposed_at_bottom_left:
                    if proximity.is_exposed_at_bottom_right:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.all
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_left_top_right_bottom_left
                elif proximity.is_exposed_at_bottom_right:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_left_top_right_bottom_right
                else:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_left_top_right
            elif proximity.is_exposed_at_bottom_left:
                if proximity.is_exposed_at_bottom_right:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_left_bottom_left_bottom_right
                else:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_left_bottom_left
            elif proximity.is_exposed_at_bottom_right:
                return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_left_bottom_right
            else:
                if proximity.is_bottom_right_neighbor_exposed_at_bottom_or_right:
                    if proximity.bottom_right_neighbor_angle_type == CellAngleType.A90:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_left.exposed_a90_bottom_right_corner
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_left.exposed_a45_bottom_right
                elif proximity.is_right_neighbor_exposed_at_right:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_left.exposed_a90_right_side
                elif proximity.is_bottom_neighbor_exposed_at_bottom:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_left.exposed_a90_bottom_side
                elif proximity.is_right_neighbor_exposed_at_right and \
                        proximity.is_bottom_neighbor_exposed_at_bottom:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_left.exposed_a90_bottom_right_sides
                else:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_left.not_exposed
        elif proximity.is_exposed_at_top_right:
            if proximity.is_exposed_at_bottom_left:
                if proximity.is_exposed_at_bottom_right:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_right_bottom_left_bottom_right
                else:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_right_bottom_left
            elif proximity.is_exposed_at_bottom_right:
                return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_right_bottom_right
            else:
                if proximity.is_bottom_left_neighbor_exposed_at_bottom_or_left:
                    if proximity.bottom_left_neighbor_angle_type == CellAngleType.A90:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_right.exposed_a90_bottom_left_corner
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_right.exposed_a45_bottom_left
                elif proximity.is_left_neighbor_exposed_at_left:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_right.exposed_a90_left_side
                elif proximity.is_bottom_neighbor_exposed_at_bottom:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_right.exposed_a90_bottom_side
                elif proximity.is_left_neighbor_exposed_at_left and \
                        proximity.is_bottom_neighbor_exposed_at_bottom:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_right.exposed_a90_bottom_left_sides
                else:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_right.not_exposed
        elif proximity.is_exposed_at_bottom_left:
            if proximity.is_exposed_at_bottom_right:
                return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_left_bottom_right
            else:
                if proximity.is_top_right_neighbor_exposed_at_top_or_right:
                    if proximity.top_right_neighbor_angle_type == CellAngleType.A90:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_left.exposed_a90_top_right_corner
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_left.exposed_a45_top_right
                elif proximity.is_right_neighbor_exposed_at_right:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_left.exposed_a90_right_side
                elif proximity.is_top_neighbor_exposed_at_top:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_left.exposed_a90_top_side
                elif proximity.is_right_neighbor_exposed_at_right and \
                        proximity.is_top_neighbor_exposed_at_top:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_left.exposed_a90_top_right_sides
                else:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_left.not_exposed
        elif proximity.is_exposed_at_bottom_right:
            if proximity.is_top_left_neighbor_exposed_at_top_or_left:
                if proximity.top_left_neighbor_angle_type == CellAngleType.A90:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_right.exposed_a90_top_left_corner
                else:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_right.exposed_a45_top_left
            elif proximity.is_left_neighbor_exposed_at_left:
                return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_right.exposed_a90_left_side
            elif proximity.is_top_neighbor_exposed_at_top:
                return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_right.exposed_a90_top_side
            elif proximity.is_left_neighbor_exposed_at_left and \
                    proximity.is_top_neighbor_exposed_at_top:
                return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_right.exposed_a90_top_left_sides
            else:
                return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_right.not_exposed
        else:
            Sc.logger.error("This seems to be an interior subtile.")
    
    return Vector2.INF


func _choose_45_degree_interior_subtile(proximity: CellProximity) -> Vector2:
    # FIXME: LEFT OFF HERE: ------------------ Handle 90-degree neighbors.
    
    if proximity.is_top_left_neighbor_exposed_at_top_or_left:
        if proximity.is_top_right_neighbor_exposed_at_top_or_right:
            if proximity.is_bottom_left_neighbor_exposed_at_bottom_or_left:
                if proximity.is_bottom_right_neighbor_exposed_at_bottom_or_right:
                    return A45_INTERIOR_SUBTILE_POSITIONS.exposed_corners.all
                else:
                    return A45_INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_top_right_bottom_left
            elif proximity.is_bottom_right_neighbor_exposed_at_bottom_or_right:
                return A45_INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_top_right_bottom_right
            else:
                return A45_INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_top_right
        elif proximity.is_bottom_left_neighbor_exposed_at_bottom_or_left:
            if proximity.is_bottom_right_neighbor_exposed_at_bottom_or_right:
                return A45_INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_bottom_left_bottom_right
            else:
                return A45_INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_bottom_left
        elif proximity.is_bottom_right_neighbor_exposed_at_bottom_or_right:
            return A45_INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_bottom_right
        else:
            return A45_INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left
    elif proximity.is_top_right_neighbor_exposed_at_top_or_right:
        if proximity.is_bottom_left_neighbor_exposed_at_bottom_left:
            if proximity.is_bottom_right_neighbor_exposed_at_bottom_or_right:
                return A45_INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_right_bottom_left_bottom_right
            else:
                return A45_INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_right_bottom_left
        elif proximity.is_bottom_right_neighbor_exposed_at_bottom_or_right:
            return A45_INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_right_bottom_right
        else:
            return A45_INTERIOR_SUBTILE_POSITIONS.exposed_corners.top_right
    elif proximity.is_bottom_left_neighbor_exposed_at_bottom_left:
        if proximity.is_bottom_right_neighbor_exposed_at_bottom_or_right:
            return A45_INTERIOR_SUBTILE_POSITIONS.exposed_corners.bottom_left_bottom_right
        else:
            return A45_INTERIOR_SUBTILE_POSITIONS.exposed_corners.bottom_left
    elif proximity.is_bottom_right_neighbor_exposed_at_bottom_or_right:
        return A45_INTERIOR_SUBTILE_POSITIONS.exposed_corners.bottom_right
    else:
        return A45_INTERIOR_SUBTILE_POSITIONS.exposed_corners.none
    
    return Vector2.INF


func _choose_27_degree_exterior_subtile(proximity: CellProximity) -> Vector2:
    # FIXME: LEFT OFF HERE: -----------------------------------
    
    return Vector2.INF


func _choose_27_degree_interior_subtile(proximity: CellProximity) -> Vector2:
    # FIXME: LEFT OFF HERE: -----------------------------------
    
    return Vector2.INF


func get_cell_autotile_bitmask(
        position: Vector2,
        tile_map: TileMap) -> int:
    var tile_id := tile_map.get_cellv(position)
    if tile_id == TileMap.INVALID_CELL:
        return INVALID_BITMASK
    
    var tile_mode := tile_get_tile_mode(tile_id)
    if tile_mode != AUTO_TILE:
        return INVALID_BITMASK
    
    var subtile_position := \
            tile_map.get_cell_autotile_coord(position.x, position.y)
    
    return autotile_get_bitmask(tile_id, subtile_position)


func get_cell_actual_bitmask(
        position: Vector2,
        tile_map: TileMap) -> int:
    var bitmask := 0
    if tile_map.get_cellv(position + Vector2(-1, -1)) != TileMap.INVALID_CELL:
        bitmask |= TileSet.BIND_TOPLEFT
    if tile_map.get_cellv(position + Vector2(0, -1)) != TileMap.INVALID_CELL:
        bitmask |= TileSet.BIND_TOP
    if tile_map.get_cellv(position + Vector2(1, -1)) != TileMap.INVALID_CELL:
        bitmask |= TileSet.BIND_TOPRIGHT
    if tile_map.get_cellv(position + Vector2(-1, 0)) != TileMap.INVALID_CELL:
        bitmask |= TileSet.BIND_LEFT
    if tile_map.get_cellv(position) != TileMap.INVALID_CELL:
        bitmask |= TileSet.BIND_CENTER
    if tile_map.get_cellv(position + Vector2(1, 0)) != TileMap.INVALID_CELL:
        bitmask |= TileSet.BIND_RIGHT
    if tile_map.get_cellv(position + Vector2(-1, 1)) != TileMap.INVALID_CELL:
        bitmask |= TileSet.BIND_BOTTOMLEFT
    if tile_map.get_cellv(position + Vector2(0, 1)) != TileMap.INVALID_CELL:
        bitmask |= TileSet.BIND_BOTTOM
    if tile_map.get_cellv(position + Vector2(1, 1)) != TileMap.INVALID_CELL:
        bitmask |= TileSet.BIND_BOTTOMRIGHT
    return bitmask


func get_angle_type_from_tile_id(tile_id: int) -> int:
    match tile_id:
        TileMap.INVALID_CELL:
            return CellAngleType.EMPTY
        tile_id_for_angle_a90:
            return CellAngleType.A90
        tile_id_for_angle_a45:
            return CellAngleType.A45
        tile_id_for_angle_a27:
            return CellAngleType.A27
        _:
            Sc.logger.error(
                    "Unrecognized tile ID: %s (%s)" % \
                    [tile_id, tile_get_name(tile_id)])
            return CellAngleType.UNKNOWN
