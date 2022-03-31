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
        audio_manifest = {
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
        },
        gui_manifest = {
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
    SurfaceTilerSchema: {
        # FIXME: LEFT OFF HERE: --------------------------------
        # - Customize this.
        tilesets = [
            {
                recalculate_tileset = [TYPE_CUSTOM, RecalculateTilesetCustomProperty],
                tile_set = preload("res://addons/squirrel_away/src/tiles/squirrel_away_tileset_with_many_angles.tres"),
                quadrant_size = 16,
                corner_match_tiles = [
                    {
                        outer_autotile_name = "autotile",
                        inner_autotile_name = "__inner_autotile__",
                        tileset_quadrants_path = \
                            "res://addons/surface_tiler/assets/images/tileset_quadrants.png",
                        tile_corner_type_annotations_path = \
                            "res://addons/surface_tiler/assets/images/tileset_corner_type_annotations.png",
                        subtile_collision_margin = 3.0,
                        are_45_degree_subtiles_used = true,
                        are_27_degree_subtiles_used = false,
                        properties = "default",
                        is_collidable = true,
                    },
                ],
                non_corner_match_tiles = [
                    {
                        name = "ungrabbable_tile",
                        properties = "disabled",
                        is_collidable = true,
                    },
                    {
                        name = "slippery_tile",
                        properties = "slippery",
                        is_collidable = true,
                    },
                    {
                        name = "sticky_tile",
                        properties = "sticky",
                        is_collidable = true,
                    },
                    {
                        name = "fast_tile",
                        properties = "fast",
                        is_collidable = true,
                    },
                    {
                        name = "slow_tile",
                        properties = "slow",
                        is_collidable = true,
                    },
                ],
            },
        ],
    },
}

var _subtractive_overrides := {
    SurfaceTilerSchema: {
        tilesets = [
            SurfacerSchema.DEFAULT_TILESET_CONFIG,
        ],
    },
}


func _init().(
        _METADATA_SCRIPT,
        _properties,
        _additive_overrides,
        _subtractive_overrides) -> void:
    pass
