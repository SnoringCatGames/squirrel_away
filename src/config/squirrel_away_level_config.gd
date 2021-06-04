class_name SquirrelAwayLevelConfig
extends SurfacerLevelConfig


const ARE_LEVELS_SCENE_BASED := true

const LEVELS_PATH_PREFIX := "res://src/levels/"

var level_manifest := {
#    "1": {
#        name = "Dev level 1",
#        version = "0.0.1",
#        priority = 10,
#        scene_path = LEVELS_PATH_PREFIX + "level1.tscn",
#        player_names = ["cat"],
#    },
#    "2": {
#        name = "Dev level 2",
#        version = "0.0.1",
#        priority = 20,
#        scene_path = LEVELS_PATH_PREFIX + "level2.tscn",
#        player_names = ["cat"],
#    },
    "3": {
        name = "Dev level 3",
        version = "0.0.1",
        priority = 30,
        scene_path = LEVELS_PATH_PREFIX + "level3.tscn",
        player_names = ["cat"],
        intro_choreography = [
            {
                is_user_interaction_enabled = false,
                zoom = 0.5,
            },
            {
                duration = 0.3,
            },
            {
                destination = SurfacerLevelConfig \
                        .INTRO_CHOREOGRAPHY_DESTINATION_GROUP_NAME,
            },
            {
                duration = 0.4,
                zoom = 1.0,
            },
            {
                is_user_interaction_enabled = true,
            },
        ],
    },
#    "4": {
#        name = "Dev level 4",
#        version = "0.0.1",
#        priority = 40,
#        scene_path = LEVELS_PATH_PREFIX + "level4.tscn",
#        player_names = ["cat"],
#    },
#    "5": {
#        name = "Dev level 5",
#        version = "0.0.1",
#        priority = 50,
#        scene_path = LEVELS_PATH_PREFIX + "level5.tscn",
#        player_names = ["cat"],
#    },
#    "6": {
#        name = "Dev level 6",
#        version = "0.0.1",
#        priority = 60,
#        scene_path = LEVELS_PATH_PREFIX + "level6.tscn",
#        player_names = ["cat", "squirrel"],
#    },
    "7": {
        name = "Dev level 7",
        version = "0.0.1",
        priority = 70,
        scene_path = LEVELS_PATH_PREFIX + "level7.tscn",
        player_names = ["cat", "squirrel"],
    },
}


func _init().(ARE_LEVELS_SCENE_BASED) -> void:
    pass


#func _sanitize_level_config(config: Dictionary) -> void:
#    ._sanitize_level_config(config)


func get_level_config(level_id: String) -> Dictionary:
    return level_manifest[level_id]


func get_level_ids() -> Array:
    return level_manifest.keys()


func get_unlock_hint(level_id: String) -> String:
    # TODO
    return "Not yet unlocked" if \
            !Gs.save_state.get_level_is_unlocked(level_id) else \
            ""


func get_suggested_next_level() -> String:
    # TODO
    var last_level_played_id := Gs.save_state.get_last_level_played()
    if last_level_played_id != "" and \
            level_manifest.has(last_level_played_id):
        return last_level_played_id
    else:
        return get_level_ids().front()
