tool
class_name SquirrelAwayTileSetWithManyAngles
extends SurfacesTileSet


const _TILES_MANIFEST := [
    {
        name = "0_tile_with_90s",
        angle = CellAngleType.A90,
        properties = "",
    },
    {
        name = "1_tile_with_45s",
        angle = CellAngleType.A45,
        properties = "",
    },
    {
        name = "2_tile_with_27s",
        angle = CellAngleType.A27,
        properties = "",
    },
    {
        name = "ungrabbable_tile",
        angle = CellAngleType.A90,
        properties = "disabled",
    },
    {
        name = "slippery_tile",
        angle = CellAngleType.A90,
        properties = "slippery",
    },
    {
        name = "sticky_tile",
        angle = CellAngleType.A90,
        properties = "sticky",
    },
    {
        name = "fast_tile",
        angle = CellAngleType.A90,
        properties = "fast",
    },
    {
        name = "slow_tile",
        angle = CellAngleType.A90,
        properties = "slow",
    },
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
    alone = Vector2(11,9),
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
            exposed_a90_bottom_right_corner = Vector2(0,36),
            exposed_a90_right_side = Vector2(2,36),
            exposed_a90_bottom_side = Vector2(4,36),
            exposed_a90_bottom_right_sides = Vector2(6,36),
            exposed_a45_bottom_right = Vector2(8,36),
        },
        top_right = {
            not_exposed = Vector2(2,9),
            exposed_a90_bottom_left_corner = Vector2(1,36),
            exposed_a90_left_side = Vector2(3,36),
            exposed_a90_bottom_side = Vector2(5,36),
            exposed_a90_bottom_left_sides = Vector2(7,36),
            exposed_a45_bottom_left = Vector2(9,36),
        },
        bottom_left = {
            not_exposed = Vector2(1,10),
            exposed_a90_top_right_corner = Vector2(0,37),
            exposed_a90_right_side = Vector2(2,37),
            exposed_a90_top_side = Vector2(4,37),
            exposed_a90_top_right_sides = Vector2(6,37),
            exposed_a45_top_right = Vector2(8,37),
        },
        bottom_right = {
            not_exposed = Vector2(2,10),
            exposed_a90_top_left_corner = Vector2(1,37),
            exposed_a90_left_side = Vector2(3,37),
            exposed_a90_top_side = Vector2(5,37),
            exposed_a90_top_left_sides = Vector2(7,37),
            exposed_a45_top_left = Vector2(9,37),
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
    floor_and_ceilings = {
        to_left_45_pos = Vector2(0,23),
        to_right_45_neg = Vector2(1,23),
        to_left_45_pos_and_right_45_pos = Vector2(2,23),
        to_left_45_pos_and_right_45_neg = Vector2(3,23),
        to_left_45_cap = Vector2(4,23),
        to_right_45_cap = Vector2(5,23),
        to_left_45_neg_and_right_45_cap = Vector2(6,23),
        to_left_45_cap_and_right_45_cap = Vector2(7,23),
        to_left_45_neg = Vector2(0,24),
        to_right_45_pos = Vector2(1,24),
        to_left_45_neg_and_right_45_neg = Vector2(2,24),
        to_left_45_neg_and_right_45_pos = Vector2(3,24),
        to_left_45_cap_and_right_45_neg = Vector2(4,24),
        to_left_45_pos_and_right_45_cap = Vector2(5,24),
        to_left_45_cap_and_right_45_pos = Vector2(6,24),
    },
    left_wall_and_right_walls = {
        to_top_45_pos = Vector2(0,21),
        to_top_45_neg = Vector2(1,21),
        to_top_45_pos_and_bottom_45_pos = Vector2(2,21),
        to_top_45_neg_and_bottom_45_neg = Vector2(3,21),
        to_top_45_cap = Vector2(4,21),
        to_top_45_cap_and_bottom_45_pos = Vector2(5,21),
        to_top_45_cap_and_bottom_45_neg = Vector2(6,21),
        to_bottom_45_neg = Vector2(0,22),
        to_bottom_45_pos = Vector2(1,22),
        to_top_45_pos_and_bottom_45_neg = Vector2(2,22),
        to_top_45_neg_and_bottom_45_pos = Vector2(3,22),
        to_bottom_45_cap = Vector2(4,22),
        to_top_45_pos_and_bottom_45_cap = Vector2(5,22),
        to_top_45_neg_and_bottom_45_cap = Vector2(6,22),
        to_bottom_45_cap_and_bottom_45_cap = Vector2(7,22),
    },
    outer_a45s_with_cutout_corners = {
        a90 = {
            floor_pos = Vector2(4,19),
            floor_neg = Vector2(5,19),
            ceiling_pos = Vector2(5,20),
            ceiling_neg = Vector2(4,20),
        },
        a90_vertical_to_a45 = {
            floor_pos = Vector2(6,19),
            floor_neg = Vector2(7,19),
            ceiling_pos = Vector2(7,20),
            ceiling_neg = Vector2(6,20),
        },
        a90_horizontal_to_a45 = {
            floor_pos = Vector2(8,19),
            floor_neg = Vector2(9,19),
            ceiling_pos = Vector2(9,20),
            ceiling_neg = Vector2(8,20),
        },
    },
    a90_sides_with_cutout_corners = {
        floor_and_left_wall = {
            a45 = Vector2(1,25),
            a90_vertical_to_a45 = Vector2(3,25),
            a90_horizontal_to_a45 = Vector2(5,25),
        },
        floor_and_right_wall = {
            a45 = Vector2(0,25),
            a90_vertical_to_a45 = Vector2(2,25),
            a90_horizontal_to_a45 = Vector2(4,25),
        },
        ceiling_and_left_wall = {
            a45 = Vector2(1,26),
            a90_vertical_to_a45 = Vector2(3,26),
            a90_horizontal_to_a45 = Vector2(5,26),
        },
        ceiling_and_right_wall = {
            a45 = Vector2(0,26),
            a90_vertical_to_a45 = Vector2(2,26),
            a90_horizontal_to_a45 = Vector2(4,26),
        },
        floors = {
            bottom_left = Vector2(3,27),
            bottom_right = Vector2(2,27),
            both = Vector2(7,25),
            to_left_a45 = {
                bottom_left = Vector2(10,27),
                bottom_right = Vector2(8,27),
                both = Vector2(10,25),
            },
            to_right_a45 = {
                bottom_left = Vector2(9,27),
                bottom_right = Vector2(11,27),
                both = Vector2(11,25),
            },
            to_left_and_right_a45 = {
                bottom_left = Vector2(2,29),
                bottom_right = Vector2(0,29),
                both = Vector2(1,29),
            },
        },
        ceilings = {
            top_left = Vector2(3,28),
            top_right = Vector2(2,28),
            both = Vector2(6,26),
            to_left_a45 = {
                top_left = Vector2(10,28),
                top_right = Vector2(8,28),
                both = Vector2(10,26),
            },
            to_right_a45 = {
                top_left = Vector2(9,28),
                top_right = Vector2(11,28),
                both = Vector2(11,26),
            },
            to_left_and_right_a45 = {
                top_left = Vector2(5,29),
                top_right = Vector2(3,29),
                both = Vector2(4,29),
            },
        },
        left_walls = {
            top_left = Vector2(1,28),
            bottom_left = Vector2(1,27),
            both = Vector2(7,26),
            to_top_a45 = {
                top_left = Vector2(7,27),
                bottom_left = Vector2(5,27),
                both = Vector2(9,25),
            },
            to_bottom_a45 = {
                top_left = Vector2(5,28),
                bottom_left = Vector2(7,28),
                both = Vector2(9,26),
            },
            to_top_and_bottom_a45 = {
                top_left = Vector2(11,29),
                bottom_left = Vector2(9,29),
                both = Vector2(10,29),
            },
        },
        right_walls = {
            top_right = Vector2(0,28),
            bottom_right = Vector2(0,27),
            both = Vector2(6,25),
            to_top_a45 = {
                top_right = Vector2(6,27),
                bottom_right = Vector2(4,27),
                both = Vector2(8,25),
            },
            to_bottom_a45 = {
                top_right = Vector2(4,28),
                bottom_right = Vector2(6,28),
                both = Vector2(8,26),
            },
            to_top_and_bottom_a45 = {
                top_right = Vector2(6,29),
                bottom_right = Vector2(8,29),
                both = Vector2(7,29),
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


func _init().(_TILES_MANIFEST) -> void:
    pass


func _is_tile_bound(
        drawn_id: int,
        neighbor_id: int) -> bool:
    if neighbor_id == TileMap.INVALID_CELL:
        return false
    
    return true


func _forward_subtile_selection(
        tile_id: int,
        bitmask: int,
        tile_map: Object,
        cell_position: Vector2):
    var proximity := CellProximity.new(
            tile_map,
            self,
            cell_position,
            tile_id)
    
    var subtile_position = _choose_subtile(proximity)
    
    if subtile_position != Vector2.INF:
        return subtile_position
    else:
        # NOTE:
        # - Not returning any value here is terrible.
        # - However, apparently Godot doesn't support returning any actual
        #   values that would indicate redirecting back to the default behavior.
        return


func _choose_subtile(proximity: CellProximity) -> Vector2:
    if proximity.is_top_empty:
        if proximity.is_bottom_empty:
            if proximity.is_left_empty:
                if proximity.is_right_empty:
                    if proximity.angle_type == CellAngleType.A90:
                        return A90_EXTERIOR_SUBTILE_POSITIONS.all
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.alone
                else:
                    # Left cap.
                    if proximity.angle_type == CellAngleType.A90:
                        return A90_EXTERIOR_SUBTILE_POSITIONS.floor_right_wall_ceiling
                    else:
                        if proximity.is_right_exposed_at_right:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.caps.left
                        elif proximity.is_top_right_empty:
                            return A90_A45_EXTERIOR_JOINS.ceilings.left_45_convex_acute
                        elif proximity.is_bottom_right_empty:
                            return A90_A45_EXTERIOR_JOINS.floors.left_45_convex_acute
                        else:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.caps.left
            elif proximity.is_right_empty:
                if proximity.angle_type == CellAngleType.A90:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.floor_left_wall_ceiling
                else:
                    # Right cap.
                    if proximity.is_left_exposed_at_left:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.caps.right
                    elif proximity.is_top_left_empty:
                        return A90_A45_EXTERIOR_JOINS.ceilings.right_45_convex_acute
                    elif proximity.is_bottom_left_empty:
                        return A90_A45_EXTERIOR_JOINS.floors.right_45_convex_acute
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.caps.right
            else:
                # FIXME: LEFT OFF HERE: ------------------------------------------
                return A90_EXTERIOR_SUBTILE_POSITIONS.floor_ceiling
        elif proximity.is_left_empty:
            if proximity.is_right_empty:
                if proximity.angle_type == CellAngleType.A90:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.floor_left_wall_right_wall
                else:
                    # Top cap.
                    if proximity.is_bottom_left_empty:
                        if proximity.is_bottom_right_empty:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.caps.top.with_bottom_cap
                        else:
                            if proximity.is_bottom_45_neg:
                                return A45_EXTERIOR_SUBTILE_POSITIONS.caps.top.with_bottom_a45_ceiling_neg
                            else:
                                return A90_A45_EXTERIOR_JOINS.right_walls.top_45_convex_acute
                    elif proximity.is_bottom_right_empty:
                        if proximity.is_bottom_45_pos:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.caps.top.with_bottom_a45_ceiling_pos
                        else:
                            return A90_A45_EXTERIOR_JOINS.left_walls.top_45_convex_acute
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.caps.top.with_bottom_floors
            else:
                if proximity.is_bottom_right_empty:
                    if proximity.angle_type == CellAngleType.A90:
                        if proximity.is_right_45_pos or \
                                proximity.is_right_angle_type_45 and \
                                    proximity.is_right_cap:
                            if proximity.is_bottom_45_pos or \
                                    proximity.is_bottom_angle_type_45 and \
                                        proximity.is_bottom_cap:
                                return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.floor_and_right_wall.a45
                            else:
                                return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.floor_and_right_wall.a90_vertical_to_a45
                        elif proximity.is_bottom_45_pos or \
                                proximity.is_bottom_angle_type_45 and \
                                    proximity.is_bottom_cap:
                            return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.floor_and_right_wall.a90_horizontal_to_a45
                        else:
                            return A90_EXTERIOR_SUBTILE_POSITIONS.floor_right_wall_sides_bottom_right_corner
                    else:
                        if proximity.is_bottom_90_left_wall:
                            if proximity.is_right_90_ceiling:
                                return A90_A45_EXTERIOR_JOINS.outer_a45s_with_cutout_corners.a90.floor_pos
                            else:
                                return A90_A45_EXTERIOR_JOINS.outer_a45s_with_cutout_corners.a90_vertical_to_a45.floor_pos
                        elif proximity.is_right_90_ceiling:
                            return A90_A45_EXTERIOR_JOINS.outer_a45s_with_cutout_corners.a90_horizontal_to_a45.floor_pos
                        else:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.floors.pos_with_cutout_corner
                else:
                    if proximity.angle_type == CellAngleType.A90:
                        return A90_EXTERIOR_SUBTILE_POSITIONS.floor_right_wall
                    else:
                        if proximity.is_right_90_floor:
                            if proximity.is_bottom_90_right_wall:
                                return A90_A45_EXTERIOR_JOINS.floors.left_45_convex_to_wall
                            else:
                                return A90_A45_EXTERIOR_JOINS.floors.left_45_convex.a45
                        elif proximity.is_bottom_90_right_wall:
                            return A90_A45_EXTERIOR_JOINS.right_walls.top_45_convex.a45
                        elif proximity.is_bottom_left_empty and \
                                proximity.is_bottom_exposed_at_bottom:
                            if proximity.is_top_right_empty and \
                                    proximity.is_right_exposed_at_right:
                                return A45_EXTERIOR_SUBTILE_POSITIONS.floors.pos_to_right_neg_and_bottom_ceiling
                            else:
                                return A45_EXTERIOR_SUBTILE_POSITIONS.floors.pos_to_bottom_ceiling
                        elif proximity.is_top_right_empty and \
                                proximity.is_right_exposed_at_right:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.floors.pos_to_right_neg
                        else:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.floors.pos
        elif proximity.is_right_empty:
            if proximity.is_bottom_left_empty:
                if proximity.angle_type == CellAngleType.A90:
                    if proximity.is_left_45_pos or \
                            proximity.is_left_angle_type_45 and \
                                proximity.is_left_cap:
                        if proximity.is_bottom_45_pos or \
                                proximity.is_bottom_angle_type_45 and \
                                    proximity.is_bottom_cap:
                            return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.floor_and_left_wall.a45
                        else:
                            return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.floor_and_left_wall.a90_vertical_to_a45
                    elif proximity.is_bottom_45_pos or \
                            proximity.is_bottom_angle_type_45 and \
                                proximity.is_bottom_cap:
                        return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.floor_and_left_wall.a90_horizontal_to_a45
                    else:
                        return A90_EXTERIOR_SUBTILE_POSITIONS.floor_left_wall_sides_bottom_left_corner
                else:
                    if proximity.is_bottom_90_right_wall:
                        if proximity.is_left_90_ceiling:
                            return A90_A45_EXTERIOR_JOINS.outer_a45s_with_cutout_corners.a90.floor_neg
                        else:
                            return A90_A45_EXTERIOR_JOINS.outer_a45s_with_cutout_corners.a90_vertical_to_a45.floor_neg
                    elif proximity.is_left_90_ceiling:
                        return A90_A45_EXTERIOR_JOINS.outer_a45s_with_cutout_corners.a90_horizontal_to_a45.floor_neg
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.floors.neg_with_cutout_corner
            else:
                if proximity.angle_type == CellAngleType.A90:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.floor_left_wall
                else:
                    if proximity.is_left_90_floor:
                        if proximity.is_bottom_90_left_wall:
                            return A90_A45_EXTERIOR_JOINS.floors.right_45_convex_to_wall
                        else:
                            return A90_A45_EXTERIOR_JOINS.floors.right_45_convex.a45
                    elif proximity.is_bottom_90_left_wall:
                        return A90_A45_EXTERIOR_JOINS.left_walls.top_45_convex.a45
                    elif proximity.is_bottom_right_empty and \
                            proximity.is_bottom_exposed_at_bottom:
                        if proximity.is_top_left_empty and \
                                proximity.is_left_exposed_at_left:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.floors.neg_to_left_pos_and_bottom_ceiling
                        else:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.floors.neg_to_bottom_ceiling
                    elif proximity.is_top_left_empty and \
                            proximity.is_left_exposed_at_left:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.floors.neg_to_left_pos
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.floors.neg
        else:
            # Floor.
            if proximity.is_bottom_left_empty:
                if proximity.is_bottom_right_empty:
                    if proximity.is_floor_with_45_curve_in_at_left:
                        if proximity.is_floor_with_45_curve_in_at_right:
                            return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.floors.to_left_and_right_a45.both
                        else:
                            return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.floors.to_left_a45.both
                    elif proximity.is_floor_with_45_curve_in_at_right:
                        return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.floors.to_right_a45.both
                    elif proximity.is_left_45_neg or \
                            proximity.is_right_45_pos or \
                            proximity.is_left_angle_type_45 and \
                                proximity.is_left_cap or \
                            proximity.is_right_angle_type_45 and \
                                proximity.is_right_cap or \
                            proximity.is_bottom_angle_type_45 and \
                                proximity.is_bottom_cap:
                        return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.floors.both
                    else:
                        return A90_EXTERIOR_SUBTILE_POSITIONS.floor_side_bottom_left_bottom_right_corners
                else:
                    if proximity.is_floor_with_45_curve_in_at_left:
                        if proximity.is_floor_with_45_curve_in_at_right:
                            return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.floors.to_left_and_right_a45.bottom_left
                        else:
                            return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.floors.to_left_a45.bottom_left
                    elif proximity.is_floor_with_45_curve_in_at_right:
                        return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.floors.to_right_a45.bottom_left
                    elif proximity.is_left_45_neg or \
                            proximity.is_left_angle_type_45 and \
                                proximity.is_left_cap:
                        return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.floors.bottom_left
                    else:
                        return A90_EXTERIOR_SUBTILE_POSITIONS.floor_side_bottom_left_corner
            elif proximity.is_bottom_right_empty:
                if proximity.is_floor_with_45_curve_in_at_left:
                    if proximity.is_floor_with_45_curve_in_at_right:
                        return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.floors.to_left_and_right_a45.bottom_right
                    else:
                        return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.floors.to_left_a45.bottom_right
                elif proximity.is_floor_with_45_curve_in_at_right:
                    return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.floors.to_right_a45.bottom_right
                elif proximity.is_right_45_pos or \
                        proximity.is_right_angle_type_45 and \
                            proximity.is_right_cap:
                    return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.floors.bottom_right
                else:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.floor_side_bottom_right_corner
            else:
                if proximity.is_floor_with_45_curve_in_at_left:
                    if proximity.is_floor_with_45_curve_in_at_right:
                        return A90_A45_EXTERIOR_JOINS.floors.left_45_right_45_convex
                    else:
                        return A90_A45_EXTERIOR_JOINS.floors.left_45_convex.a90
                elif proximity.is_floor_with_45_curve_in_at_right:
                    return A90_A45_EXTERIOR_JOINS.floors.right_45_convex.a90
                else:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.floor
    elif proximity.is_bottom_empty:
        # Top side is not exposed.
        if proximity.is_left_empty:
            if proximity.is_right_empty:
                # Bottom cap.
                if proximity.angle_type == CellAngleType.A90:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.left_wall_right_wall_ceiling
                else:
                    if proximity.is_top_left_empty:
                        if proximity.is_top_right_empty:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.caps.bottom.with_top_cap
                        else:
                            if proximity.is_top_45_pos:
                                return A45_EXTERIOR_SUBTILE_POSITIONS.caps.bottom.with_top_a45_floor_pos
                            else:
                                return A90_A45_EXTERIOR_JOINS.right_walls.bottom_45_convex_acute
                    elif proximity.is_top_right_empty:
                        if proximity.is_top_45_neg:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.caps.bottom.with_top_a45_floor_neg
                        else:
                            return A90_A45_EXTERIOR_JOINS.left_walls.bottom_45_convex_acute
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.caps.bottom.with_top_ceilings
            else:
                if proximity.is_top_right_empty:
                    if proximity.angle_type == CellAngleType.A90:
                        if proximity.is_right_45_pos or \
                                proximity.is_right_angle_type_45 and \
                                    proximity.is_right_cap:
                            if proximity.is_top_45_pos or \
                                    proximity.is_top_angle_type_45 and \
                                        proximity.is_top_cap:
                                return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.ceiling_and_right_wall.a45
                            else:
                                return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.ceiling_and_right_wall.a90_vertical_to_a45
                        elif proximity.is_top_45_pos or \
                                proximity.is_top_angle_type_45 and \
                                    proximity.is_top_cap:
                            return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.ceiling_and_right_wall.a90_horizontal_to_a45
                        else:
                            return A90_EXTERIOR_SUBTILE_POSITIONS.right_wall_ceiling_sides_top_right_corner
                    else:
                        if proximity.is_top_90_left_wall:
                            if proximity.is_right_90_floor:
                                return A90_A45_EXTERIOR_JOINS.outer_a45s_with_cutout_corners.a90.ceiling_neg
                            else:
                                return A90_A45_EXTERIOR_JOINS.outer_a45s_with_cutout_corners.a90_vertical_to_a45.ceiling_neg
                        elif proximity.is_right_90_floor:
                            return A90_A45_EXTERIOR_JOINS.outer_a45s_with_cutout_corners.a90_horizontal_to_a45.ceiling_neg
                        else:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.ceilings.neg_with_cutout_corner
                else:
                    if proximity.angle_type == CellAngleType.A90:
                        return A90_EXTERIOR_SUBTILE_POSITIONS.right_wall_ceiling
                    else:
                        if proximity.is_right_90_ceiling:
                            if proximity.is_top_90_right_wall:
                                return A90_A45_EXTERIOR_JOINS.ceilings.left_45_convex_to_wall
                            else:
                                return A90_A45_EXTERIOR_JOINS.ceilings.left_45_convex.a45
                        elif proximity.is_top_90_right_wall:
                            return A90_A45_EXTERIOR_JOINS.right_walls.bottom_45_convex.a45
                        elif proximity.is_top_left_empty and \
                                proximity.is_top_exposed_at_top:
                            if proximity.is_bottom_right_empty and \
                                    proximity.is_right_exposed_at_right:
                                return A45_EXTERIOR_SUBTILE_POSITIONS.ceilings.neg_to_right_pos_and_top_floor
                            else:
                                return A45_EXTERIOR_SUBTILE_POSITIONS.ceilings.neg_to_top_floor
                        elif proximity.is_bottom_right_empty and \
                                proximity.is_right_exposed_at_right:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.ceilings.neg_to_right_pos
                        else:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.ceilings.neg
        elif proximity.is_right_empty:
            if proximity.is_top_left_empty:
                if proximity.angle_type == CellAngleType.A90:
                    if proximity.is_left_45_pos or \
                            proximity.is_left_angle_type_45 and \
                                proximity.is_left_cap:
                        if proximity.is_top_45_pos or \
                                proximity.is_top_angle_type_45 and \
                                    proximity.is_top_cap:
                            return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.ceiling_and_left_wall.a45
                        else:
                            return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.ceiling_and_left_wall.a90_vertical_to_a45
                    elif proximity.is_top_45_pos or \
                            proximity.is_top_angle_type_45 and \
                                proximity.is_top_cap:
                        return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.ceiling_and_left_wall.a90_horizontal_to_a45
                    else:
                        return A90_EXTERIOR_SUBTILE_POSITIONS.left_wall_ceiling_sides_top_left_corner
                else:
                    if proximity.is_top_90_right_wall:
                        if proximity.is_left_90_floor:
                            return A90_A45_EXTERIOR_JOINS.outer_a45s_with_cutout_corners.a90.ceiling_pos
                        else:
                            return A90_A45_EXTERIOR_JOINS.outer_a45s_with_cutout_corners.a90_vertical_to_a45.ceiling_pos
                    elif proximity.is_left_90_floor:
                        return A90_A45_EXTERIOR_JOINS.outer_a45s_with_cutout_corners.a90_horizontal_to_a45.ceiling_pos
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.ceilings.pos_with_cutout_corner
            else:
                if proximity.angle_type == CellAngleType.A90:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.left_wall_ceiling
                else:
                    if proximity.is_left_90_ceiling:
                        if proximity.is_top_90_left_wall:
                            return A90_A45_EXTERIOR_JOINS.ceilings.right_45_convex_to_wall
                        else:
                            return A90_A45_EXTERIOR_JOINS.ceilings.right_45_convex.a45
                    elif proximity.is_top_90_left_wall:
                        return A90_A45_EXTERIOR_JOINS.left_walls.bottom_45_convex.a45
                    elif proximity.is_top_right_empty and \
                            proximity.is_top_exposed_at_top:
                        if proximity.is_bottom_left_empty and \
                                proximity.is_left_exposed_at_left:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.ceilings.pos_to_left_neg_and_top_floor
                        else:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.ceilings.pos_to_top_floor
                    elif proximity.is_bottom_left_empty and \
                            proximity.is_left_exposed_at_left:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.ceilings.pos_to_left_neg
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.ceilings.pos
        else:
            # Ceiling.
            if proximity.is_top_left_empty:
                if proximity.is_top_right_empty:
                    if proximity.is_ceiling_with_45_curve_in_at_left:
                        if proximity.is_ceiling_with_45_curve_in_at_right:
                            return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.ceilings.to_left_and_right_a45.both
                        else:
                            return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.ceilings.to_left_a45.both
                    elif proximity.is_ceiling_with_45_curve_in_at_right:
                        return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.ceilings.to_right_a45.both
                    elif proximity.is_left_45_neg or \
                            proximity.is_right_45_pos or \
                            proximity.is_left_angle_type_45 and \
                                proximity.is_left_cap or \
                            proximity.is_right_angle_type_45 and \
                                proximity.is_right_cap or \
                            proximity.is_top_angle_type_45 and \
                                proximity.is_top_cap:
                        return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.ceilings.both
                    else:
                        return A90_EXTERIOR_SUBTILE_POSITIONS.ceiling_side_top_left_top_right_corners
                else:
                    if proximity.is_ceiling_with_45_curve_in_at_left:
                        if proximity.is_ceiling_with_45_curve_in_at_right:
                            return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.ceilings.to_left_and_right_a45.top_left
                        else:
                            return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.ceilings.to_left_a45.top_left
                    elif proximity.is_ceiling_with_45_curve_in_at_right:
                        return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.ceilings.to_right_a45.top_left
                    elif proximity.is_left_45_neg or \
                            proximity.is_left_angle_type_45 and \
                                proximity.is_left_cap:
                        return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.ceilings.top_left
                    else:
                        return A90_EXTERIOR_SUBTILE_POSITIONS.ceiling_side_top_left_corner
            elif proximity.is_top_right_empty:
                if proximity.is_ceiling_with_45_curve_in_at_left:
                    if proximity.is_ceiling_with_45_curve_in_at_right:
                        return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.ceilings.to_left_and_right_a45.top_right
                    else:
                        return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.ceilings.to_left_a45.top_right
                elif proximity.is_ceiling_with_45_curve_in_at_right:
                    return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.ceilings.to_right_a45.top_right
                elif proximity.is_right_45_pos or \
                        proximity.is_right_angle_type_45 and \
                            proximity.is_right_cap:
                    return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.ceilings.top_right
                else:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.ceiling_side_top_right_corner
            else:
                if proximity.is_ceiling_with_45_curve_in_at_left:
                    if proximity.is_ceiling_with_45_curve_in_at_right:
                        return A90_A45_EXTERIOR_JOINS.ceilings.left_45_right_45_convex
                    else:
                        return A90_A45_EXTERIOR_JOINS.ceilings.left_45_convex.a90
                elif proximity.is_ceiling_with_45_curve_in_at_right:
                    return A90_A45_EXTERIOR_JOINS.ceilings.right_45_convex.a90
                else:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.ceiling
    elif proximity.is_left_empty:
        # Top and bottom sides are not exposed.
        if proximity.is_right_empty:
            # FIXME: LEFT OFF HERE: ---------------------------------------
            return A90_EXTERIOR_SUBTILE_POSITIONS.left_wall_right_wall
        else:
            # Right wall.
            if proximity.is_top_right_empty:
                if proximity.is_bottom_right_empty:
                    if proximity.is_right_wall_with_45_curve_in_at_top:
                        if proximity.is_right_wall_with_45_curve_in_at_bottom:
                            return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.right_walls.to_top_and_bottom_a45.both
                        else:
                            return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.right_walls.to_top_a45.both
                    elif proximity.is_right_wall_with_45_curve_in_at_bottom:
                        return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.right_walls.to_bottom_a45.both
                    elif proximity.is_top_45_neg or \
                            proximity.is_bottom_45_pos or \
                            proximity.is_top_angle_type_45 and \
                                proximity.is_top_cap or \
                            proximity.is_bottom_angle_type_45 and \
                                proximity.is_bottom_cap or \
                            proximity.is_right_angle_type_45 and \
                                proximity.is_right_cap:
                        return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.right_walls.both
                    else:
                        return A90_EXTERIOR_SUBTILE_POSITIONS.right_wall_side_top_right_bottom_right_corners
                else:
                    if proximity.is_right_wall_with_45_curve_in_at_top:
                        if proximity.is_right_wall_with_45_curve_in_at_bottom:
                            return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.right_walls.to_top_and_bottom_a45.top_right
                        else:
                            return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.right_walls.to_top_a45.top_right
                    elif proximity.is_right_wall_with_45_curve_in_at_bottom:
                        return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.right_walls.to_bottom_a45.top_right
                    elif proximity.is_top_45_neg or \
                            proximity.is_top_angle_type_45 and \
                                proximity.is_top_cap:
                        return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.right_walls.top_right
                    else:
                        return A90_EXTERIOR_SUBTILE_POSITIONS.right_wall_side_top_right_corner
            elif proximity.is_bottom_right_empty:
                if proximity.is_right_wall_with_45_curve_in_at_top:
                    if proximity.is_right_wall_with_45_curve_in_at_bottom:
                        return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.right_walls.to_top_and_bottom_a45.bottom_right
                    else:
                        return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.right_walls.to_top_a45.bottom_right
                elif proximity.is_right_wall_with_45_curve_in_at_bottom:
                    return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.right_walls.to_bottom_a45.bottom_right
                elif proximity.is_bottom_45_pos or \
                        proximity.is_bottom_angle_type_45 and \
                            proximity.is_bottom_cap:
                    return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.right_walls.bottom_right
                else:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.right_wall_side_bottom_right_corner
            else:
                if proximity.is_right_wall_with_45_curve_in_at_top:
                    if proximity.is_right_wall_with_45_curve_in_at_bottom:
                        return A90_A45_EXTERIOR_JOINS.right_walls.top_45_bottom_45_convex
                    else:
                        return A90_A45_EXTERIOR_JOINS.right_walls.top_45_convex.a90
                elif proximity.is_right_wall_with_45_curve_in_at_bottom:
                    return A90_A45_EXTERIOR_JOINS.right_walls.bottom_45_convex.a90
                else:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.right_wall
    elif proximity.is_right_empty:
        # Left wall.
        # Only the right-side is exposed.
        if proximity.is_top_left_empty:
            if proximity.is_bottom_left_empty:
                if proximity.is_left_wall_with_45_curve_in_at_top:
                    if proximity.is_left_wall_with_45_curve_in_at_bottom:
                        return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.left_walls.to_top_and_bottom_a45.both
                    else:
                        return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.left_walls.to_top_a45.both
                elif proximity.is_left_wall_with_45_curve_in_at_bottom:
                    return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.left_walls.to_bottom_a45.both
                elif proximity.is_top_45_neg or \
                        proximity.is_bottom_45_pos or \
                        proximity.is_top_angle_type_45 and \
                            proximity.is_top_cap or \
                        proximity.is_bottom_angle_type_45 and \
                            proximity.is_bottom_cap or \
                            proximity.is_left_angle_type_45 and \
                                proximity.is_left_cap:
                    return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.left_walls.both
                else:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.left_wall_side_top_left_bottom_left_corners
            else:
                if proximity.is_left_wall_with_45_curve_in_at_top:
                    if proximity.is_left_wall_with_45_curve_in_at_bottom:
                        return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.left_walls.to_top_and_bottom_a45.top_left
                    else:
                        return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.left_walls.to_top_a45.top_left
                elif proximity.is_left_wall_with_45_curve_in_at_bottom:
                    return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.left_walls.to_bottom_a45.top_left
                elif proximity.is_top_45_neg or \
                        proximity.is_top_angle_type_45 and \
                            proximity.is_top_cap:
                    return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.left_walls.top_left
                else:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.left_wall_side_top_left_corner
        elif proximity.is_bottom_left_empty:
            if proximity.is_left_wall_with_45_curve_in_at_top:
                if proximity.is_left_wall_with_45_curve_in_at_bottom:
                    return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.left_walls.to_top_and_bottom_a45.bottom_left
                else:
                    return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.left_walls.to_top_a45.bottom_left
            elif proximity.is_left_wall_with_45_curve_in_at_bottom:
                return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.left_walls.to_bottom_a45.bottom_left
            elif proximity.is_bottom_45_pos or \
                    proximity.is_bottom_angle_type_45 and \
                        proximity.is_bottom_cap:
                return A90_A45_EXTERIOR_JOINS.a90_sides_with_cutout_corners.left_walls.bottom_left
            else:
                return A90_EXTERIOR_SUBTILE_POSITIONS.left_wall_side_bottom_left_corner
        else:
            if proximity.is_left_wall_with_45_curve_in_at_top:
                if proximity.is_left_wall_with_45_curve_in_at_bottom:
                    return A90_A45_EXTERIOR_JOINS.left_walls.top_45_bottom_45_convex
                else:
                    return A90_A45_EXTERIOR_JOINS.left_walls.top_45_convex.a90
            elif proximity.is_left_wall_with_45_curve_in_at_bottom:
                return A90_A45_EXTERIOR_JOINS.left_walls.bottom_45_convex.a90
            else:
                return A90_EXTERIOR_SUBTILE_POSITIONS.left_wall
        
    else:
        # No sides are exposed.
        if proximity.is_top_left_empty:
            if proximity.is_top_right_empty:
                if proximity.is_bottom_left_empty:
                    if proximity.is_bottom_right_empty:
                        if proximity.angle_type == CellAngleType.A90:
                            return A90_EXTERIOR_SUBTILE_POSITIONS.all_corners
                        else:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.all
                    else:
                        if proximity.angle_type == CellAngleType.A90:
                            return A90_EXTERIOR_SUBTILE_POSITIONS.top_left_top_right_bottom_left_corners
                        else:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_left_top_right_bottom_left
                elif proximity.is_bottom_right_empty:
                    if proximity.angle_type == CellAngleType.A90:
                        return A90_EXTERIOR_SUBTILE_POSITIONS.top_left_top_right_bottom_right_corners
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_left_top_right_bottom_right
                else:
                    if proximity.angle_type == CellAngleType.A90:
                        return A90_EXTERIOR_SUBTILE_POSITIONS.top_left_top_right_corners
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_left_top_right
            elif proximity.is_bottom_left_empty:
                if proximity.is_bottom_right_empty:
                    if proximity.angle_type == CellAngleType.A90:
                        return A90_EXTERIOR_SUBTILE_POSITIONS.top_left_bottom_left_bottom_right_corners
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_left_bottom_left_bottom_right
                else:
                    if proximity.angle_type == CellAngleType.A90:
                        return A90_EXTERIOR_SUBTILE_POSITIONS.top_left_bottom_left_corners
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_left_bottom_left
            elif proximity.is_bottom_right_empty:
                if proximity.angle_type == CellAngleType.A90:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.top_left_bottom_right_corners
                else:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_left_bottom_right
            else:
                if proximity.angle_type == CellAngleType.A90:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.top_left_corner
                else:
                    if proximity.is_bottom_right_exposed_at_bottom_or_right:
                        # FIXME: LEFT OFF HERE: ------------
                        # - Replace with a non-tile-type-specific check; instead, check for a 90-90 cutout.
                        if proximity.bottom_right_angle_type == CellAngleType.A90:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_left.exposed_a90_bottom_right_corner
                        else:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_left.exposed_a45_bottom_right
                    elif proximity.is_right_exposed_at_right:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_left.exposed_a90_right_side
                    elif proximity.is_bottom_exposed_at_bottom:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_left.exposed_a90_bottom_side
                    elif proximity.is_right_exposed_at_right and \
                            proximity.is_bottom_exposed_at_bottom:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_left.exposed_a90_bottom_right_sides
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_left.not_exposed
        elif proximity.is_top_right_empty:
            # Not exposed at top-left corner.
            if proximity.is_bottom_left_empty:
                if proximity.is_bottom_right_empty:
                    if proximity.angle_type == CellAngleType.A90:
                        return A90_EXTERIOR_SUBTILE_POSITIONS.top_right_bottom_left_bottom_right_corners
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_right_bottom_left_bottom_right
                else:
                    if proximity.angle_type == CellAngleType.A90:
                        return A90_EXTERIOR_SUBTILE_POSITIONS.top_right_bottom_left_corners
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_right_bottom_left
            elif proximity.is_bottom_right_empty:
                if proximity.angle_type == CellAngleType.A90:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.top_right_bottom_right_corners
                else:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_right_bottom_right
            else:
                if proximity.angle_type == CellAngleType.A90:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.top_right_corner
                else:
                    if proximity.is_bottom_left_exposed_at_bottom_or_left:
                        # FIXME: LEFT OFF HERE: ------------
                        # - Replace with a non-tile-type-specific check; instead, check for a 90-90 cutout.
                        if proximity.bottom_left_angle_type == CellAngleType.A90:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_right.exposed_a90_bottom_left_corner
                        else:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_right.exposed_a45_bottom_left
                    elif proximity.is_left_exposed_at_left:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_right.exposed_a90_left_side
                    elif proximity.is_bottom_exposed_at_bottom:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_right.exposed_a90_bottom_side
                    elif proximity.is_left_exposed_at_left and \
                            proximity.is_bottom_exposed_at_bottom:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_right.exposed_a90_bottom_left_sides
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.top_right.not_exposed
        elif proximity.is_bottom_left_empty:
            # Not exposed at top corners.
            if proximity.is_bottom_right_empty:
                if proximity.angle_type == CellAngleType.A90:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.bottom_left_bottom_right_corners
                else:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_left_bottom_right
            else:
                if proximity.angle_type == CellAngleType.A90:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.bottom_left_corner
                else:
                    if proximity.is_top_right_exposed_at_top_or_right:
                        # FIXME: LEFT OFF HERE: ------------
                        # - Replace with a non-tile-type-specific check; instead, check for a 90-90 cutout.
                        if proximity.top_right_angle_type == CellAngleType.A90:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_left.exposed_a90_top_right_corner
                        else:
                            return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_left.exposed_a45_top_right
                    elif proximity.is_right_exposed_at_right:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_left.exposed_a90_right_side
                    elif proximity.is_top_exposed_at_top:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_left.exposed_a90_top_side
                    elif proximity.is_right_exposed_at_right and \
                            proximity.is_top_exposed_at_top:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_left.exposed_a90_top_right_sides
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_left.not_exposed
        elif proximity.is_bottom_right_empty:
            # Only exposed at bottom-right.
            if proximity.angle_type == CellAngleType.A90:
                return A90_EXTERIOR_SUBTILE_POSITIONS.bottom_right_corner
            else:
                if proximity.is_top_left_exposed_at_top_or_left:
                        # FIXME: LEFT OFF HERE: ------------
                        # - Replace with a non-tile-type-specific check; instead, check for a 90-90 cutout.
                    if proximity.top_left_angle_type == CellAngleType.A90:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_right.exposed_a90_top_left_corner
                    else:
                        return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_right.exposed_a45_top_left
                elif proximity.is_left_exposed_at_left:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_right.exposed_a90_left_side
                elif proximity.is_top_exposed_at_top:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_right.exposed_a90_top_side
                elif proximity.is_left_exposed_at_left and \
                        proximity.is_top_exposed_at_top:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_right.exposed_a90_top_left_sides
                else:
                    return A45_EXTERIOR_SUBTILE_POSITIONS.cutout_corners.bottom_right.not_exposed
        else:
            return _choose_interior_subtile(proximity)
    
    return Vector2.INF


func _choose_interior_subtile(proximity: CellProximity) -> Vector2:
    # FIXME: LEFT OFF HERE: ------------ Distinguish between 90 and 45 degrees according to neighbors.
    
    if proximity.is_top_exposed_around_top:
        if proximity.is_bottom_exposed_around_bottom:
            if proximity.is_left_exposed_around_left:
                if proximity.is_right_exposed_around_right:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.all
                else:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.top_bottom_left
            elif proximity.is_right_exposed_around_right:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.top_bottom_right
            else:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.top_bottom
        elif proximity.is_left_exposed_around_left:
            if proximity.is_right_exposed_around_right:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.top_left_right
            else:
                if proximity.is_bottom_right_exposed_around_bottom_right:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.top_left_sides_bottom_right_corner
                else:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.top_left
        elif proximity.is_right_exposed_around_right:
            if proximity.is_bottom_left_exposed_around_bottom_left:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.top_right_sides_bottom_left_corner
            else:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.top_right
        else:
            if proximity.is_bottom_left_exposed_around_bottom_left:
                if proximity.is_bottom_right_exposed_around_bottom_right:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.top_side_bottom_left_bottom_right_corners
                else:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.top_side_bottom_left_corner
            elif proximity.is_bottom_right_exposed_around_bottom_right:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.top_side_bottom_right_corner
            else:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.top
    elif proximity.is_bottom_exposed_around_bottom:
        if proximity.is_left_exposed_around_left:
            if proximity.is_right_exposed_around_right:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.bottom_left_right
            else:
                if proximity.is_top_right_exposed_around_top_right:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.bottom_left_sides_top_right_corner
                else:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.bottom_left
        elif proximity.is_right_exposed_around_right:
            if proximity.is_top_left_exposed_around_top_left:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.bottom_right_sides_top_left_corner
            else:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.bottom_right
        else:
            if proximity.is_top_left_exposed_around_top_left:
                if proximity.is_top_right_exposed_around_top_right:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.bottom_side_top_left_top_right_corners
                else:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.bottom_side_top_left_corner
            elif proximity.is_top_right_exposed_around_top_right:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.bottom_side_top_right_corner
            else:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.bottom
    elif proximity.is_left_exposed_around_left:
        if proximity.is_right_exposed_around_right:
            return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.left_right
        else:
            if proximity.is_top_right_exposed_around_top_right:
                if proximity.is_bottom_right_exposed_around_bottom_right:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.left_side_top_right_bottom_right_corners
                else:
                    return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.left_side_top_right_corner
            elif proximity.is_bottom_right_exposed_around_bottom_right:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.left_side_bottom_right_corner
            else:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.left
    elif proximity.is_right_exposed_around_right:
        if proximity.is_top_left_exposed_around_top_left:
            if proximity.is_bottom_left_exposed_around_bottom_left:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.right_side_top_left_bottom_left_corners
            else:
                return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.right_side_top_left_corner
        elif proximity.is_bottom_left_exposed_around_bottom_left:
            return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides_and_corners.right_side_bottom_left_corner
        else:
            return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.right
        
    else:
        if proximity.is_top_left_exposed_around_top_left:
            if proximity.is_top_right_exposed_around_top_right:
                if proximity.is_bottom_left_exposed_around_bottom_left:
                    if proximity.is_bottom_right_exposed_around_bottom_right:
                        return A90_EXTERIOR_SUBTILE_POSITIONS.exposed_corners.all
                    else:
                        return A90_EXTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_top_right_bottom_left
                elif proximity.is_bottom_right_exposed_around_bottom_right:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_top_right_bottom_right
                else:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_top_right
            elif proximity.is_bottom_left_exposed_around_bottom_left:
                if proximity.is_bottom_right_exposed_around_bottom_right:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_bottom_left_bottom_right
                else:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_bottom_left
            elif proximity.is_bottom_right_exposed_around_bottom_right:
                return A90_EXTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left_bottom_right
            else:
                return A90_EXTERIOR_SUBTILE_POSITIONS.exposed_corners.top_left
        elif proximity.is_top_right_exposed_around_top_right:
            if proximity.is_bottom_left_exposed_at_bottom_left:
                if proximity.is_bottom_right_exposed_around_bottom_right:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.exposed_corners.top_right_bottom_left_bottom_right
                else:
                    return A90_EXTERIOR_SUBTILE_POSITIONS.exposed_corners.top_right_bottom_left
            elif proximity.is_bottom_right_exposed_around_bottom_right:
                return A90_EXTERIOR_SUBTILE_POSITIONS.exposed_corners.top_right_bottom_right
            else:
                return A90_EXTERIOR_SUBTILE_POSITIONS.exposed_corners.top_right
        elif proximity.is_bottom_left_exposed_at_bottom_left:
            if proximity.is_bottom_right_exposed_around_bottom_right:
                return A90_EXTERIOR_SUBTILE_POSITIONS.exposed_corners.bottom_left_bottom_right
            else:
                return A90_EXTERIOR_SUBTILE_POSITIONS.exposed_corners.bottom_left
        elif proximity.is_bottom_right_exposed_around_bottom_right:
            return A90_EXTERIOR_SUBTILE_POSITIONS.exposed_corners.bottom_right
        else:
            return A90_INTERIOR_SUBTILE_POSITIONS.exposed_sides.none
    
    return Vector2.INF
