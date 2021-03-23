extends Node2D
class_name ScaffoldLevel

var level_start_time: float

func _ready() -> void:
    Gs.utils.connect( \
            "display_resized", \
            self, \
            "_on_resized")
    _on_resized()

func _on_resized() -> void:
    pass

func start() -> void:
    level_start_time = Gs.time.elapsed_play_time_actual_sec

func destroy() -> void:
    pass

func quit() -> void:
    pass
