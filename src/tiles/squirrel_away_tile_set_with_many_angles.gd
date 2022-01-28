tool
class_name SquirrelAwayTileSetWithManyAngles
extends CornerMatchAutotilingTileSet


const _TILES_MANIFEST := [
    {
        name = "0_tile_with_90s",
        angle = CellAngleType.A90,
        properties = "",
        is_collidable = true,
    },
    {
        name = "1_tile_with_45s",
        angle = CellAngleType.A45,
        properties = "",
        is_collidable = true,
    },
    {
        name = "2_tile_with_27s",
        angle = CellAngleType.A27,
        properties = "",
        is_collidable = true,
    },
    {
        name = "ungrabbable_tile",
        angle = CellAngleType.A90,
        properties = "disabled",
        is_collidable = true,
    },
    {
        name = "slippery_tile",
        angle = CellAngleType.A90,
        properties = "slippery",
        is_collidable = true,
    },
    {
        name = "sticky_tile",
        angle = CellAngleType.A90,
        properties = "sticky",
        is_collidable = true,
    },
    {
        name = "fast_tile",
        angle = CellAngleType.A90,
        properties = "fast",
        is_collidable = true,
    },
    {
        name = "slow_tile",
        angle = CellAngleType.A90,
        properties = "slow",
        is_collidable = true,
    },
    
    # FIXME: ----------------- REMOVE
    {
        name = "0_tile_with_90s_old",
        angle = CellAngleType.A90,
        properties = "",
        is_collidable = true,
    },
    {
        name = "1_tile_with_45s_old",
        angle = CellAngleType.A45,
        properties = "",
        is_collidable = true,
    },
]

# Subtile configuration specification:
# {
#     # Required.
#     p: Vector2,
#     a: Array<90|45|27>,
#     tl: SubtileBinding,
#     tr: SubtileBinding,
#     bl: SubtileBinding,
#     br: SubtileBinding,
#     
#     # Optional.
#     inbound_t_bl: SubtileBinding,
#     inbound_t_br: SubtileBinding,
#     inbound_b_tl: SubtileBinding,
#     inbound_b_tr: SubtileBinding,
#     inbound_l_tr: SubtileBinding,
#     inbound_l_br: SubtileBinding,
#     inbound_r_tl: SubtileBinding,
#     inbound_r_bl: SubtileBinding,
# }

# NOTE:
# -   This must to be kept in-sync with the corresponding tile-set image.
# -   Autotile bitmasks must also be defined using the normal Godot TileSet
#     editor.
const _SUBTILES_MANIFEST := {
    # FIXME: LEFT OFF HERE: -----------------------------------------
    # - Don't encode bitmasks here!
    #   - Instead, use the handy tool in the tile-set editor.
    #   - Then, query the TileSet to get the bitmask and store each on its
    #     config here.
    #   - Just need to figure out how to determine when a bit is optional...
    #     - It looks like this was never exposed as a public API, so it's
    #       unusable for us.
    #     - It _should_ be something like TileSet.BIND_IGNORE_RIGHT.
    #     - Instead, the optional bits will show up as empty for us.
    #     - That should be ok...
    # - 
    
#    FULLY_INTERNAL_BITMASK
#    TileSet.BIND_TOPLEFT
#    TileSet.BIND_TOP
#    TileSet.BIND_TOPRIGHT
#    TileSet.BIND_LEFT
#    TileSet.BIND_CENTER
#    TileSet.BIND_RIGHT
#    TileSet.BIND_BOTTOMLEFT
#    TileSet.BIND_BOTTOM
#    TileSet.BIND_BOTTOMRIGHT
    
    error_indicator_subtile_position = Vector2(10,1),
    subtiles = [
        {
            p = Vector2(),
            a = [90],
#            top_left = 
#            interior_exposure = ,
        },
    ],
}

const _ALLOWS_PARTIAL_MATCHES := true
const _SUPPORTS_RUNTIME_AUTOTILING := false

func _init().(
        _TILES_MANIFEST,
        _SUBTILES_MANIFEST,
        _ALLOWS_PARTIAL_MATCHES,
        _SUPPORTS_RUNTIME_AUTOTILING) -> void:
    pass
