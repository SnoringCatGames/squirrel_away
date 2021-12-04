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


func _init().(_PROPERTIES_MANIFEST) -> void:
    pass


func _is_tile_bound( \
        drawn_id: int, \
        neighbor_id: int) -> bool:
    if neighbor_id == TileMap.INVALID_CELL:
        return false
    
    return true
