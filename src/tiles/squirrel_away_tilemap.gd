tool
class_name SquirrelAwayTilemap
extends SurfacesTilemap


const DEFAULT_TILE_SET := preload( \
        "res://addons/squirrel_away/src/tiles/squirrel_away_surfaces_tileset.tres")


func _ready() -> void:
    if tile_set == null or \
            tile_set == Su.default_tileset:
        tile_set = DEFAULT_TILE_SET
