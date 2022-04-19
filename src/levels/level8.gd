tool
class_name Level8
extends SquirrelAwayLevel


func _on_initial_input() -> void:
    ._on_initial_input()
    _attach_behavior_move_targets()


func _attach_behavior_move_targets() -> void:
    for squirrel in characters['squirrel']:
        for behavior_class in [
                    RunAwayBehavior,
                    CollideBehavior,
                    FollowBehavior,
                ]:
            var behavior: Behavior = \
                    squirrel.get_behavior(behavior_class)
            if is_instance_valid(behavior):
                behavior.move_target = _active_player_character
                behavior.trigger(false)
