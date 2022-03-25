tool
class_name SquirrelAwayMetadata
extends PluginMetadata


const DISPLAY_NAME := "Squirrel Away"
const FOLDER_NAME := "squirrel_away"
const AUTO_LOAD_NAME := "SquirrelAway"
const AUTO_LOAD_DEPS := ["Sc", "Su", "St"]
const AUTO_LOAD_PATH := "res://addons/squirrel_away/src/config/squirrel_away.gd"
const PLUGIN_ICON_PATH_PREFIX := \
        "res://addons/scaffolder/assets/images/editor_icons/plugin/star"
const SCHEMA_PATH := \
        "res://addons/squirrel_away/src/plugin/squirrel_away_schema.gd"
const MANIFEST_PATH := "res://addons/squirrel_away/src/config/manifest.json"
const MODES := {}


func _init().(
        DISPLAY_NAME,
        FOLDER_NAME,
        AUTO_LOAD_NAME,
        AUTO_LOAD_DEPS,
        AUTO_LOAD_PATH,
        PLUGIN_ICON_PATH_PREFIX,
        SCHEMA_PATH,
        MANIFEST_PATH,
        MODES) -> void:
    pass
