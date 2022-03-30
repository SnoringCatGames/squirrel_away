tool
class_name SquirrelAwaySchema
extends FrameworkSchema


const _METADATA_SCRIPT := SquirrelAwayMetadata

var _properties := {
}

var _additive_overrides := {
    ScaffolderSchema: {
        colors_manifest = \
            Utils.get_direct_color_properties(SquirrelAwayDefaultColors.new()),
        annotation_parameters_manifest = Utils.get_direct_non_color_properties(
            SquirrelAwayDefaultAnnotationParameters.new()),
        music_manifest = [
            # {
            #     name = "my_music",
            #     path_prefix = "res://addons/squirrel_away/assets/music/",
            #     volume_db = 0.0,
            #     bpm = 75.0,
            #     meter = 4,
            # },
        ],
        sounds_manifest = [
            # {
            #     name = "my_sound",
            #     volume_db = 0.0,
            #     path_prefix = "res://addons/squirrel_away/assets/sounds/",
            # },
        ],
        gui_manifest = {
            # FIXME: LEFT OFF HERE: ------------ Include this in all other frameworks too.
            third_party_license_text = \
                    SquirrelAwayThirdPartyLicenses.TEXT + \
                    SurfaceTilerThirdPartyLicenses.TEXT + \
                    ScaffolderThirdPartyLicenses.TEXT + \
                    SurfacerThirdPartyLicenses.TEXT,
            settings_item_manifest = {
                groups = {
                    annotations = {
                        item_classes = [
                        ],
                    },
                    hud = {
                        item_classes = [
                        ],
                    },
                    miscellaneous = {
                        item_classes = [
                        ],
                    },
                },
            },
            hud_manifest = {
                hud_key_value_box_size = Vector2(256.0, 48.0),
                hud_key_value_list_item_manifest = [
                ],
                is_hud_visible_by_default = true,
                is_inspector_enabled_default = false,
                inspector_panel_starts_open = false,
            },
            welcome_panel_manifest = {
                items = [
                ],
            },
            screen_manifest = {
                screens = [
                ],
            },
        },
    },
}

var _subtractive_overrides := {}


func _init().(
        _METADATA_SCRIPT,
        _properties,
        _additive_overrides,
        _subtractive_overrides) -> void:
    pass
