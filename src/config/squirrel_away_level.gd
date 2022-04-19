tool
class_name SquirrelAwayLevel
extends SurfacerLevel


var _does_level_have_squirrels := false

var cat: Cat

# NOTE: This is a hack so that we don't see errors about SquirrelAway not being
#       declared when we aren't in the squirrel_away project.
var SquirrelAway: Node


func _ready() -> void:
    if has_node("/root/SquirrelAway"):
        SquirrelAway = get_node("/root/SquirrelAway")


#func _load() -> void:
#    ._load()


func _start() -> void:
    ._start()
    
    cat = _active_player_character

    _does_level_have_squirrels = \
            Sc.levels.get_level_config(Sc.levels.session.id) \
            .platform_graph_character_category_names.has("squirrel")


#func _destroy() -> void:
#    ._destroy()


#func _on_initial_input() -> void:
#    ._on_initial_input()


#func quit(immediately := true) -> void:
#    .quit(immediately)


#func _on_intro_choreography_finished() -> void:
#    ._on_intro_choreography_finished()


#func pause() -> void:
#    .pause()


#func on_unpause() -> void:
#    .on_unpause()


func get_music_name() -> String:
    return "on_a_quest"


func get_slow_motion_music_name() -> String:
    # FIXME: Add slo-mo music
    return ""
