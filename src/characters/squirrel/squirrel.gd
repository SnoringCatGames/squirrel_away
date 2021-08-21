tool
class_name Squirrel
extends SurfacerCharacter


func _on_entered_proximity(
        target: Node2D,
        layer_names: Array) -> void:
    match layer_names[0]:
        "cats":
            _run_away(target)
        _:
            Sc.logger.error()


func _run_away(cat: Cat) -> void:
    $RunAwayBehavior.target_to_run_from = cat
    $RunAwayBehavior.trigger(true)


func _process_sounds() -> void:
    if just_triggered_jump:
        Sc.audio.play_sound("squirrel_jump")
    
    if surface_state.just_left_air:
        Sc.audio.play_sound("squirrel_land")
