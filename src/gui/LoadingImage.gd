class_name LoadingImage
extends Control


var _base_scale := 1.0


func set_base_scale(value: float) -> void:
    _base_scale = value
    update_gui_scale(_base_scale)


func update_gui_scale(gui_scale: float) -> bool:
    rect_position *= gui_scale
    rect_min_size *= gui_scale
    rect_size *= gui_scale
    $Control.rect_position *= gui_scale
    $Control/AnimatedSprite.scale *= gui_scale
    return true
