tool
class_name SquirrelAwayTileMapWithManyAngles
extends SurfacesTileMap


const DEFAULT_TILE_SET := preload( \
        "res://addons/squirrel_away/src/tiles/squirrel_away_tile_set_with_many_angles.tres")


func _ready() -> void:
    if tile_set == null or \
            tile_set == Su.default_tile_set:
        tile_set = DEFAULT_TILE_SET
    
    connect("cell_tile_changed", self, "_on_cell_tile_changed")


func _on_cell_tile_changed(
        cell_position: Vector2,
        next_tile_id: int,
        previous_tile_id: int) -> void:
    if next_tile_id == INVALID_CELL or \
            previous_tile_id == INVALID_CELL:
        call_deferred(
                "update_bitmask_region",
                cell_position + Vector2(-2, -2),
                cell_position + Vector2(2, 2))
