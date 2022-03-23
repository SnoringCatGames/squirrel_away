tool
class_name SquirrelAwayInterface
extends SurfacerDefaultAppManifest


# ---

# This method is useful for defining parameters that are likely to change
# between builds or between development and production environments.
func _override_configs_for_current_run() -> void:
    # TODO: Remember to reset these when creating releases.
    pass # FIXME: LEFT OFF HERE: --------------------------------
##    var debug_window_size = ScaffolderGuiConfig.SCREEN_RESOLUTIONS.default
#    var debug_window_size = ScaffolderGuiConfig.SCREEN_RESOLUTIONS.full_screen
##    var debug_window_size = ScaffolderGuiConfig.SCREEN_RESOLUTIONS.google_ads_portrait
#
#    var are_annotations_emphasized := false
##    var are_annotations_emphasized := true
#
#    _metadata.app_version = "0.0.1"
#
#    _metadata.debug = true and OS.is_debug_build()
#    _metadata.playtest = false
#    _metadata.rng_seed = 723
#    _metadata.pauses_on_focus_out = false
#    _metadata.also_prints_to_stdout = true
#    _metadata.logs_character_events = true
#    _metadata.logs_analytics_events = false
#    _metadata.logs_bootstrap_events = false
#    _metadata.logs_device_settings = false
#    _metadata.logs_in_editor_events = true
#    _metadata.are_all_levels_unlocked = true
#    _metadata.are_test_levels_included = true
#    _metadata.is_save_state_cleared_for_debugging = false
#    _metadata.opens_directly_to_level_id = "11"
#    _metadata.is_splash_skipped = true
#    _metadata.are_button_controls_enabled_by_default = true
#
#    _surfacer_manifest.are_loaded_surfaces_deeply_validated = false
#
#    _character_manifest.omits_npcs = false
#
#    _surfacer_manifest.precompute_platform_graph_for_levels = [
##        "3",
##        "6",
##        "7",
##        "8",
##        "9",
##        "10",
#        "11",
##        "12",
#    ]
#    _surfacer_manifest.ignores_platform_graph_save_files = false
#
#    _gui_manifest.debug_window_size = debug_window_size
#    _gui_manifest.hud_manifest.is_inspector_enabled_default = false
#    _gui_manifest.hud_manifest.is_hud_visible_by_default = true
#
##    _surfacer_debug_params.limit_parsing = {
##        character_name = "cat",
##
##        edge_type = EdgeType.JUMP_FROM_SURFACE_EDGE,
###        edge_type = EdgeType.CLIMB_TO_ADJACENT_SURFACE_EDGE,
###        edge_type = EdgeType.FALL_FROM_WALL_EDGE,
###        edge_type = EdgeType.FALL_FROM_FLOOR_EDGE,
##
##        edge = {
##            origin = {
##                surface_side = SurfaceSide.FLOOR,
###                surface_start_vertex = Vector2(-64, 64),
##                position = Vector2(-71.599, 896),
##                epsilon = 10,
##            },
##            destination = {
##                surface_side = SurfaceSide.RIGHT_WALL,
###                surface_start_vertex = Vector2(128, -128),
##                position = Vector2(64, 756),
##                epsilon = 10,
##            },
###            velocity_start = Vector2(0, -1000),
##        },
##    }
#
#    if are_annotations_emphasized:
#        _update_to_emphasize_annotations(app_manifest)
#
#    _derive_overrides_according_to_debug_or_playtest(app_manifest)
#
#
#func _derive_overrides_according_to_debug_or_playtest(
#        app_manifest: Dictionary) -> void:
#    ._derive_overrides_according_to_debug_or_playtest(app_manifest)
#    _character_manifest.omits_npcs = \
#            _character_manifest.omits_npcs and _metadata.debug

# ---

const _SCHEMA_PATH := "res://addons/squirrel_away/src/plugin/squirrel_away_schema.gd"

var _is_using_pixel_style := true

var _uses_threads := false and OS.can_use_threads()

var _metadata := {
    uses_threads = _uses_threads,
    thread_count = OS.get_processor_count() if _uses_threads else 1,
}

const _images_overrides := {
    app_logo = preload("res://addons/squirrel_away/assets/images/logo.png"),
    app_logo_scale = 1.0,
    
    developer_logo = preload( \
            "res://addons/scaffolder/assets/images/logos/snoring_cat_logo_about.png"),
    developer_splash = preload( \
            "res://addons/scaffolder/assets/images/logos/snoring_cat_logo_splash.png"),
    
    go_normal = preload( \
            "res://addons/squirrel_away/assets/images/gui/go_icon.png"),
    go_scale = 1.5,
}

var _additional_metric_keys := [
    "start_new_squirrel_navigation",
]

var _surfacer_manifest := {
    uses_threads_for_platform_graph_calculation = false and _uses_threads,
}

var app_manifest := {
}

var _overrides := {
    images_manifest = _images_overrides,
}

# ---


func _init().(_SCHEMA_PATH) -> void:
    pass


func _get_members_to_destroy() -> Array:
    return []


func _override_configs_for_app() -> void:
    ._override_configs_for_app()
    
    # FIXME: LEFT OFF HERE: -----------------------------------------
#    if _is_using_pixel_style:
#        app_manifest.gui_manifest.fonts_manifest = \
#                _default_fonts_manifest_pixel
#        app_manifest.styles_manifest = _styles_manifest_pixel
#        app_manifest.images_manifest = _default_images_manifest_pixel
#    else:
#        app_manifest.gui_manifest.fonts_manifest = \
#                _default_fonts_manifest_normal
#        app_manifest.styles_manifest = _default_styles_manifest_normal
#        app_manifest.images_manifest = _default_images_manifest_normal
    
    _override_manifest(app_manifest, _overrides)


func _configure_sub_modules() -> void:
    Sc.profiler.preregister_metric_keys(_additional_metric_keys)


func _load_state() -> void:
    ._load_state()
