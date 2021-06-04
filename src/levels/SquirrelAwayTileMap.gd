tool
class_name SquirrelAwayTileMap
extends SurfacesTileMap

const DEFAULT_TILE_SET := \
        preload("res://src/levels/squirrel_away_tile_set.tres")


func _ready() -> void:
    if tile_set == null:
        tile_set = DEFAULT_TILE_SET
