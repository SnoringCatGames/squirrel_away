tool
class_name Squirrel
extends SurfacerCharacter


var run_away_behavior: RunAwayBehavior


func _ready() -> void:
    run_away_behavior = get_behavior(RunAwayBehavior)


func _on_entered_proximity(
        target: Node2D,
        layer_names: Array) -> void:
    match layer_names[0]:
        "cats":
            _run_away(target)
        _:
            Sc.logger.error("Squirrel._on_entered_proximity")


func _run_away(cat: Cat) -> void:
    if is_instance_valid(run_away_behavior):
        run_away_behavior.move_target = cat
        run_away_behavior.trigger(true)


func _process_sounds() -> void:
    # Override parent class.
    #._process_sounds()
    
    if just_triggered_jump:
        Sc.audio.play_sound("squirrel_jump")
    
    if surface_state.just_left_air:
        Sc.audio.play_sound("squirrel_land")
