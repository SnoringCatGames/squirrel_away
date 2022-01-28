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

const _ALLOWS_PARTIAL_MATCHES := true
const _SUPPORTS_RUNTIME_AUTOTILING := false


func _init().(
        _TILES_MANIFEST,
        SquirrelAwaySubtilesManifest.SUBTILES,
        _ALLOWS_PARTIAL_MATCHES,
        _SUPPORTS_RUNTIME_AUTOTILING) -> void:
    pass
