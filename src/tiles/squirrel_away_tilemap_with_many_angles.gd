tool
class_name SquirrelAwayTilemapWithManyAngles
extends SurfacesTilemap


const DEFAULT_TILE_SET := preload( \
        "res://addons/squirrel_away/src/tiles/squirrel_away_tileset_with_many_angles.tres")


func _ready() -> void:
    if tile_set == null or \
            tile_set == Su.default_tileset:
        tile_set = DEFAULT_TILE_SET
