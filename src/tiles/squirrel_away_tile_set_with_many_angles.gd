tool
class_name SquirrelAwayTileSetWithManyAngles
extends SurfacesTileSet


const _TILE_IDS := [
    "1_tile_with_90s",
    "2_tile_with_45s",
    "3_tile_with_27s_floors_pos",
    "4_tile_with_27s_floors_neg",
    "5_tile_with_27s_ceilings_pos",
    "6_tile_with_27s_ceilings_neg",
    "7_tile_with_halves",
    "8_tile_with_odd_joins",
    "9_tile_with_corner_caps",
]

const _DISABLED_SURFACES_TILE_ID_SET := {
}

const _SLIPPERY_SURFACES_TILE_ID_SET := {
}

const _STICKY_SURFACES_TILE_ID_SET := {
}


func _get_tile_manifest() -> Dictionary:
    var manifest := {}
    for tile_id in _TILE_IDS:
        var tile_config := {}
        if _DISABLED_SURFACES_TILE_ID_SET.has(tile_id):
            tile_config.surface_properties = Su.surface_properties["disabled"]
        if _SLIPPERY_SURFACES_TILE_ID_SET.has(tile_id):
            tile_config.surface_properties = Su.surface_properties["slippery"]
        if _STICKY_SURFACES_TILE_ID_SET.has(tile_id):
            tile_config.surface_properties = Su.surface_properties["sticky"]
        else:
            tile_config.surface_properties = Su.surface_properties["default"]
        manifest[tile_id] = tile_config
    return manifest


func _is_tile_bound( \
        drawn_id: int, \
        neighbor_id: int) -> bool:
    if neighbor_id == TileMap.INVALID_CELL:
        return false
    
    return true
