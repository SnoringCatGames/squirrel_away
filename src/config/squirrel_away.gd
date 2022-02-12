tool
extends SurfacerDefaultAppManifest


# ---

# This method is useful for defining parameters that are likely to change
# between builds or between development and production environments.
func _override_configs_for_current_run() -> void:
    # TODO: Remember to reset these when creating releases.
    
#    var debug_window_size = ScaffolderGuiConfig.SCREEN_RESOLUTIONS.default
    var debug_window_size = ScaffolderGuiConfig.SCREEN_RESOLUTIONS.full_screen
#    var debug_window_size = ScaffolderGuiConfig.SCREEN_RESOLUTIONS.google_ads_portrait
    
    var are_annotations_emphasized := false
#    var are_annotations_emphasized := true
    
    _metadata.app_version = "0.0.1"
    
    _metadata.debug = true and OS.is_debug_build()
    _metadata.playtest = false
    _metadata.rng_seed = 723
    _metadata.pauses_on_focus_out = false
    _metadata.also_prints_to_stdout = true
    _metadata.logs_character_events = true
    _metadata.logs_analytics_events = false
    _metadata.logs_bootstrap_events = false
    _metadata.logs_device_settings = false
    _metadata.logs_in_editor_events = true
    _metadata.are_all_levels_unlocked = true
    _metadata.are_test_levels_included = true
    _metadata.is_save_state_cleared_for_debugging = false
    _metadata.opens_directly_to_level_id = "11"
    _metadata.is_splash_skipped = true
    _metadata.are_button_controls_enabled_by_default = true
    
    _surfacer_manifest.are_loaded_surfaces_deeply_validated = false
    
    _character_manifest.omits_npcs = false
    
    _surfacer_manifest.precompute_platform_graph_for_levels = [
#        "3",
#        "6",
#        "7",
#        "8",
#        "9",
#        "10",
        "11",
#        "12",
    ]
    _surfacer_manifest.ignores_platform_graph_save_files = false
    
    _gui_manifest.debug_window_size = debug_window_size
    _gui_manifest.hud_manifest.is_inspector_enabled_default = false
    _gui_manifest.hud_manifest.is_hud_visible_by_default = true
    
#    _surfacer_debug_params.limit_parsing = {
#        character_name = "cat",
#
#        edge_type = EdgeType.JUMP_FROM_SURFACE_EDGE,
##        edge_type = EdgeType.CLIMB_TO_ADJACENT_SURFACE_EDGE,
##        edge_type = EdgeType.FALL_FROM_WALL_EDGE,
##        edge_type = EdgeType.FALL_FROM_FLOOR_EDGE,
#
#        edge = {
#            origin = {
#                surface_side = SurfaceSide.FLOOR,
##                surface_start_vertex = Vector2(-64, 64),
#                position = Vector2(-71.599, 896),
#                epsilon = 10,
#            },
#            destination = {
#                surface_side = SurfaceSide.RIGHT_WALL,
##                surface_start_vertex = Vector2(128, -128),
#                position = Vector2(64, 756),
#                epsilon = 10,
#            },
##            velocity_start = Vector2(0, -1000),
#        },
#    }
    
    if are_annotations_emphasized:
        _update_to_emphasize_annotations(app_manifest)
    
    _derive_overrides_according_to_debug_or_playtest(app_manifest)


func _derive_overrides_according_to_debug_or_playtest(
        manifest: Dictionary) -> void:
    ._derive_overrides_according_to_debug_or_playtest(manifest)
    _character_manifest.omits_npcs = \
            _character_manifest.omits_npcs and _metadata.debug

# ---


var _is_using_pixel_style := true

var _uses_threads := false and OS.can_use_threads()

var _metadata := {
    debug = false,
    playtest = false,
    pauses_on_focus_out = true,
    also_prints_to_stdout = true,
    logs_character_events = true,
    logs_analytics_events = true,
    logs_bootstrap_events = true,
    logs_device_settings = true,
    logs_in_editor_events = true,
    is_profiler_enabled = true,
    are_all_levels_unlocked = true,
    is_splash_skipped = false,
    uses_threads = _uses_threads,
    thread_count = OS.get_processor_count() if _uses_threads else 1,
    rng_seed = 176,
    is_mobile_supported = true,
    uses_level_scores = false,
    must_restart_level_to_change_settings = true,
    overrides_project_settings = true,
    overrides_input_map = true,
    are_button_controls_enabled_by_default = false,
    base_path = "addons/squirrel_away/",
    
    app_name = "Squirrel Away",
    app_id = "games.snoringcat.squirrel_away",
    app_version = "0.0.3",
    score_version = "0.0.1",
    data_agreement_version = "0.0.1",
    
    # Must start with "UA-".
    google_analytics_id = "UA-186405125-2",
    privacy_policy_url = \
            "https://snoringcat.games/squirrel-away/privacy-policy",
    terms_and_conditions_url = \
            "https://snoringcat.games/squirrel-away/terms-and-conditions",
    android_app_store_url = "",
    ios_app_store_url = "",
    support_url = "https://snoringcat.games/support",
    log_gestures_url = "",
    error_logs_url = \
            "https://storage.googleapis.com/upload/storage/v1/b/squirrel-away-logs/o",
    app_id_query_param = "squirrel-away",
    
    developer_name = "Snoring Cat LLC",
    developer_url = "https://snoringcat.games",
    github_url = "https://github.com/SnoringCatGames/squirrel_away",
    
    godot_splash_screen_duration = 0.8,
    developer_splash_screen_duration = 1.0,
}

var _images_overrides := {
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

var _sounds_manifest := [
    {
        name = "fall",
        volume_db = 18.0,
        path_prefix = "res://addons/scaffolder/assets/sounds/",
    },
    {
        name = "cadence_win",
        volume_db = 10.0,
        path_prefix = "res://addons/scaffolder/assets/sounds/",
    },
    {
        name = "cadence_lose",
        volume_db = 10.0,
        path_prefix = "res://addons/scaffolder/assets/sounds/",
    },
    {
        name = "menu_select",
        volume_db = -2.0,
        path_prefix = "res://addons/scaffolder/assets/sounds/",
    },
    {
        name = "menu_select_fancy",
        volume_db = -6.0,
        path_prefix = "res://addons/scaffolder/assets/sounds/",
    },
    {
        name = "lock_low",
        volume_db = 0.0,
        path_prefix = "res://addons/scaffolder/assets/sounds/",
    },
    {
        name = "lock_high",
        volume_db = 0.0,
        path_prefix = "res://addons/scaffolder/assets/sounds/",
    },
    {
        name = "walk",
        volume_db = 15.0,
        path_prefix = "res://addons/scaffolder/assets/sounds/",
    },
    {
        name = "achievement",
        volume_db = 12.0,
        path_prefix = "res://addons/scaffolder/assets/sounds/",
    },
    {
        name = "single_cat_snore",
        volume_db = 17.0,
        path_prefix = "res://addons/scaffolder/assets/sounds/",
    },
    
    {
        name = "cat_jump",
        volume_db = 0.0,
    },
    {
        name = "cat_land",
        volume_db = 0.0,
    },
    {
        name = "cat_hit_surface",
        volume_db = 0.0,
    },
    {
        name = "contact",
        volume_db = 0.0,
    },
    {
        name = "squirrel_jump",
        volume_db = 0.0,
    },
    {
        name = "squirrel_land",
        volume_db = 0.0,
    },
    {
        name = "squirrel_yell",
        volume_db = 0.0,
    },
]

var _music_manifest := [
    {
        name = "on_a_quest",
        path_prefix = "res://addons/scaffolder/assets/music/",
        volume_db = 0.0,
        bpm = 75,
        meter = 4,
    },
    {
        name = "pause_menu",
        path_prefix = "res://addons/scaffolder/assets/music/",
        volume_db = 0.0,
        bpm = 56.25,
        meter = 4,
    },
]

var _audio_manifest := {
    sounds_manifest = _sounds_manifest,
    default_sounds_path_prefix = "res://addons/squirrel_away/assets/sounds/",
    default_sounds_file_suffix = ".wav",
    default_sounds_bus_index = 1,
    
    music_manifest = _music_manifest,
    default_music_path_prefix = "res://addons/scaffolder/assets/music/",
    default_music_file_suffix = ".ogg",
    default_music_bus_index = 2,
    
    godot_splash_sound = "achievement",
    developer_splash_sound = "single_cat_snore",
    level_end_sound_win = "cadence_win",
    level_end_sound_lose = "cadence_lose",
    
    main_menu_music = "on_a_quest",
    game_over_music = "pause_menu",
    pause_menu_music = "pause_menu",
    default_level_music = "on_a_quest",
    
    pauses_level_music_on_pause = true,
    
    are_beats_tracked_by_default = true,
    
    is_arbitrary_music_speed_change_supported = true,
    is_music_speed_scaled_with_time_scale = true,
    is_music_speed_scaled_with_additional_debug_time_scale = true,
    
    is_music_paused_in_slow_motion = true,
    is_tick_tock_played_in_slow_motion = true,
    is_slow_motion_start_stop_sound_effect_played = true,
}

var COLOR_BACKGROUND := Color("453d30")
var COLOR_BACKGROUND_LIGHTER := Color("574d3d")
var COLOR_BACKGROUND_DARKER := Color("362f25")

var COLOR_TEXT := Color("eeeeee")
var COLOR_HEADER := Color("faca7d")
var COLOR_FOCUS := Color("faca7d")

var COLOR_BUTTON := Color("c27e10")
var COLOR_BUTTON_LIGHTER := Color("eba534")
var COLOR_BUTTON_DARKER := Color("734905")

var COLOR_SHADOW := Color("88000000")

var HUD_KEY_VALUE_BOX_MODULATE_COLOR := Color(0.1, 0.7, 1.2, 1.0)
var BUTTON_PULSE_MODULATE_COLOR := Color(1.5, 1.5, 3.0, 1.0)

var _colors_manifest := {
    # Scaffolder colors.
    
    # Should match Project Settings > Application > Boot Splash > Bg Color.
    boot_splash_background = \
            ScaffolderColors.DEFAULT_BOOT_SPLASH_BACKGROUND_COLOR,
    # Should match
    #     Project Settings > Rendering > Environment > Default Clear Color.
    background = COLOR_BACKGROUND,
    text = COLOR_TEXT,
    header = COLOR_HEADER,
    focus_border = COLOR_FOCUS,
    link_normal = COLOR_BUTTON_LIGHTER,
    link_hover = COLOR_BUTTON,
    link_pressed = COLOR_BUTTON_DARKER,
    button_normal = COLOR_BUTTON,
    button_pulse_modulate = BUTTON_PULSE_MODULATE_COLOR,
    button_disabled = COLOR_BUTTON_LIGHTER,
    button_focused = COLOR_BUTTON_LIGHTER,
    button_hover = COLOR_BUTTON_LIGHTER,
    button_pressed = COLOR_BUTTON_DARKER,
    button_border = COLOR_TEXT,
    dropdown_normal = COLOR_BACKGROUND,
    dropdown_disabled = COLOR_BACKGROUND_LIGHTER,
    dropdown_focused = COLOR_BACKGROUND_LIGHTER,
    dropdown_hover = COLOR_BACKGROUND_LIGHTER,
    dropdown_pressed = COLOR_BACKGROUND_DARKER,
    dropdown_border = COLOR_BACKGROUND_DARKER,
    tooltip = COLOR_BACKGROUND,
    tooltip_bg = COLOR_TEXT,
    popup_background = COLOR_BACKGROUND_LIGHTER,
    scroll_bar_background = COLOR_BACKGROUND_LIGHTER,
    scroll_bar_grabber_normal = COLOR_BUTTON,
    scroll_bar_grabber_hover = COLOR_BUTTON_LIGHTER,
    scroll_bar_grabber_pressed = COLOR_BUTTON_DARKER,
    slider_background = COLOR_BACKGROUND_DARKER,
    zebra_stripe_even_row = COLOR_BACKGROUND_LIGHTER,
    overlay_panel_background = COLOR_BACKGROUND_DARKER,
    overlay_panel_border = COLOR_TEXT,
    notification_panel_background = COLOR_BACKGROUND_DARKER,
    notification_panel_border = COLOR_TEXT,
    header_panel_background = COLOR_BACKGROUND,
    screen_border = COLOR_TEXT,
    shadow = COLOR_SHADOW,
    
    click = ScaffolderColors.static_opacify(
            SurfacerColors.WHITE, ScaffolderColors.ALPHA_SLIGHTLY_FAINT),
    ruler = SurfacerColors.WHITE,
    
    # Surfacer colors.
    
    surface_click_selection = ScaffolderColors.static_opacify(
            SurfacerColors.WHITE, ScaffolderColors.ALPHA_SOLID),
    grid_indices = ScaffolderColors.static_opacify(
            SurfacerColors.WHITE, ScaffolderColors.ALPHA_FAINT),
    invalid = SurfacerColors.RED,
    inspector_origin = ScaffolderColors.static_opacify(
            SurfacerColors.ORANGE, ScaffolderColors.ALPHA_FAINT),
}

var _styles_manifest_pixel := {
    button_content_margin_left = 16.0,
    button_content_margin_top = 8.0,
    button_content_margin_right = 16.0,
    button_content_margin_bottom = 8.0,
    
    button_shine_margin_left = 6.0,
    button_shine_margin_top = 6.0,
    button_shine_margin_right = 6.0,
    button_shine_margin_bottom = 6.0,
    
    focus_border_nine_patch = \
            preload("res://addons/scaffolder/assets/images/gui/nine_patch/focus_border.png"),
    focus_border_nine_patch_margin_left = 3.5,
    focus_border_nine_patch_margin_top = 3.5,
    focus_border_nine_patch_margin_right = 3.5,
    focus_border_nine_patch_margin_bottom = 3.5,
    focus_border_nine_patch_scale = 3.0,
    focus_border_expand_margin_left = 3.0,
    focus_border_expand_margin_top = 3.0,
    focus_border_expand_margin_right = 3.0,
    focus_border_expand_margin_bottom = 3.0,
    
    button_pressed_nine_patch = \
            preload("res://addons/scaffolder/assets/images/gui/nine_patch/button_pressed.png"),
    button_disabled_nine_patch = \
            preload("res://addons/scaffolder/assets/images/gui/nine_patch/button_hover.png"),
    button_hover_nine_patch = \
            preload("res://addons/scaffolder/assets/images/gui/nine_patch/button_hover.png"),
    button_normal_nine_patch = \
            preload("res://addons/scaffolder/assets/images/gui/nine_patch/button_normal.png"),
    button_nine_patch_margin_left = 3.5,
    button_nine_patch_margin_top = 3.5,
    button_nine_patch_margin_right = 3.5,
    button_nine_patch_margin_bottom = 3.5,
    button_nine_patch_scale = 3.0,
    
    dropdown_pressed_nine_patch = \
            preload("res://addons/scaffolder/assets/images/gui/nine_patch/dropdown_pressed.png"),
    dropdown_disabled_nine_patch = \
            preload("res://addons/scaffolder/assets/images/gui/nine_patch/dropdown_hover.png"),
    dropdown_hover_nine_patch = \
            preload("res://addons/scaffolder/assets/images/gui/nine_patch/dropdown_hover.png"),
    dropdown_normal_nine_patch = \
            preload("res://addons/scaffolder/assets/images/gui/nine_patch/dropdown_normal.png"),
    dropdown_nine_patch_margin_left = 3.5,
    dropdown_nine_patch_margin_top = 3.5,
    dropdown_nine_patch_margin_right = 3.5,
    dropdown_nine_patch_margin_bottom = 3.5,
    dropdown_nine_patch_scale = 3.0,
    
    scroll_track_nine_patch = \
            preload("res://addons/scaffolder/assets/images/gui/nine_patch/scroll_track.png"),
    scroll_track_nine_patch_margin_left = 3.5,
    scroll_track_nine_patch_margin_top = 3.5,
    scroll_track_nine_patch_margin_right = 3.5,
    scroll_track_nine_patch_margin_bottom = 3.5,
    scroll_track_nine_patch_scale = 3.0,
    
    scroll_grabber_pressed_nine_patch = \
            preload("res://addons/scaffolder/assets/images/gui/nine_patch/scroll_grabber_pressed.png"),
    scroll_grabber_hover_nine_patch = \
            preload("res://addons/scaffolder/assets/images/gui/nine_patch/scroll_grabber_hover.png"),
    scroll_grabber_normal_nine_patch = \
            preload("res://addons/scaffolder/assets/images/gui/nine_patch/scroll_grabber_normal.png"),
    scroll_grabber_nine_patch_margin_left = 3.5,
    scroll_grabber_nine_patch_margin_top = 3.5,
    scroll_grabber_nine_patch_margin_right = 3.5,
    scroll_grabber_nine_patch_margin_bottom = 3.5,
    scroll_grabber_nine_patch_scale = 3.0,
    
    slider_track_nine_patch = \
            preload("res://addons/scaffolder/assets/images/gui/nine_patch/slider_track.png"),
    slider_track_nine_patch_margin_left = 1.5,
    slider_track_nine_patch_margin_top = 1.5,
    slider_track_nine_patch_margin_right = 1.5,
    slider_track_nine_patch_margin_bottom = 1.5,
    slider_track_nine_patch_scale = 3.0,
    
    overlay_panel_border_width = 2,
    
    overlay_panel_nine_patch = \
            preload("res://addons/scaffolder/assets/images/gui/nine_patch/overlay_panel.png"),
    overlay_panel_nine_patch_margin_left = 3.5,
    overlay_panel_nine_patch_margin_top = 3.5,
    overlay_panel_nine_patch_margin_right = 3.5,
    overlay_panel_nine_patch_margin_bottom = 3.5,
    overlay_panel_nine_patch_scale = 3.0,
    overlay_panel_content_margin_left = 3.0,
    overlay_panel_content_margin_top = 3.0,
    overlay_panel_content_margin_right = 3.0,
    overlay_panel_content_margin_bottom = 3.0,
    
    notification_panel_border_width = 2,
    
    notification_panel_nine_patch = \
            preload("res://addons/scaffolder/assets/images/gui/nine_patch/notification_panel.png"),
    notification_panel_nine_patch_margin_left = 3.5,
    notification_panel_nine_patch_margin_top = 3.5,
    notification_panel_nine_patch_margin_right = 3.5,
    notification_panel_nine_patch_margin_bottom = 3.5,
    notification_panel_nine_patch_scale = 3.0,
    notification_panel_content_margin_left = 3.0,
    notification_panel_content_margin_top = 3.0,
    notification_panel_content_margin_right = 3.0,
    notification_panel_content_margin_bottom = 3.0,
    
    header_panel_content_margin_left = 0.0,
    header_panel_content_margin_top = 0.0,
    header_panel_content_margin_right = 0.0,
    header_panel_content_margin_bottom = 0.0,
    
    hud_panel_nine_patch = \
            preload("res://addons/scaffolder/assets/images/gui/nine_patch/overlay_panel.png"),
    hud_panel_nine_patch_margin_left = 3.5,
    hud_panel_nine_patch_margin_top = 3.5,
    hud_panel_nine_patch_margin_right = 3.5,
    hud_panel_nine_patch_margin_bottom = 3.5,
    hud_panel_nine_patch_scale = 3.0,
    hud_panel_content_margin_left = 8.0,
    hud_panel_content_margin_top = 2.0,
    hud_panel_content_margin_right = 8.0,
    hud_panel_content_margin_bottom = 2.0,
    
    screen_shadow_size = 0,
    screen_shadow_offset = Vector2.ZERO,
    screen_border_width = 0,
}

var _settings_item_manifest := {
    groups = {
        main = {
            label = "",
            is_collapsible = false,
            item_classes = [
                MusicControlRow,
                SoundEffectsControlRow,
                HapticFeedbackControlRow,
            ],
        },
        annotations = {
            label = "Rendering",
            is_collapsible = true,
            item_classes = [
                RulerAnnotatorControlRow,
                PlayerPreselectionTrajectoryAnnotatorControlRow,
                PlayerSlowMoTrajectoryAnnotatorControlRow,
                PlayerNonSlowMoTrajectoryAnnotatorControlRow,
                PlayerPreviousTrajectoryAnnotatorControlRow,
                PlayerNavigationDestinationAnnotatorControlRow,
                NpcSlowMoTrajectoryAnnotatorControlRow,
                NpcNonSlowMoTrajectoryAnnotatorControlRow,
                NpcPreviousTrajectoryAnnotatorControlRow,
                NpcNavigationDestinationAnnotatorControlRow,
                RecentMovementAnnotatorControlRow,
                SurfacesAnnotatorControlRow,
                CharacterPositionAnnotatorControlRow,
                CharacterAnnotatorControlRow,
                LevelAnnotatorControlRow,
            ],
        },
        hud = {
            label = "HUD",
            is_collapsible = true,
            item_classes = [
                InspectorEnabledControlRow,
                DebugPanelControlRow,
            ],
        },
        miscellaneous = {
            label = "Miscellaneous",
            is_collapsible = true,
            item_classes = [
                ButtonControlsControlRow,
                WelcomePanelControlRow,
                IntroChoreographyControlRow,
                CameraZoomControlRow,
                TimeScaleControlRow,
                MetronomeControlRow,
            ],
        },
    },
}

var _pause_item_manifest := [
    LevelControlRow,
    TimeControlRow,
    FastestTimeControlRow,
]

var _game_over_item_manifest := [
    LevelControlRow,
    TimeControlRow,
    FastestTimeControlRow,
]

var _level_select_item_manifest := [
    TotalPlaysControlRow,
    FastestTimeControlRow,
]

var _hud_manifest := {
    hud_class = SurfacerHud,
    hud_key_value_box_size = \
            ScaffolderGuiConfig.HUD_KEY_VALUE_BOX_DEFAULT_SIZE,
    hud_key_value_box_scene = \
            preload("res://addons/scaffolder/src/gui/hud/hud_key_value_box.tscn"),
    hud_key_value_list_scene = \
            preload("res://addons/scaffolder/src/gui/hud/hud_key_value_list.tscn"),
    hud_key_value_list_item_manifest = [
        {
            item_class = TimeControlRow,
            settings_enablement_label = "Time",
            enabled_by_default = true,
            settings_group_key = "hud",
        },
    ],
    is_inspector_enabled_default = false,
    inspector_panel_starts_open = false,
    is_hud_visible_by_default = true,
}

var _welcome_panel_manifest := {
    items = [
        ["*Auto nav*", "click"],
        ["Inspect graph", "ctrl + click (x2)"],
        ["Walk/Climb", "arrow key / wasd"],
        ["Jump", "space / x"],
        ["Grab surface", "c"],
        ["Dash", "z"],
        ["Zoom in/out", "ctrl + =/-"],
        ["Pan", "ctrl + arrow key"],
    ],
    header_color = [
    ],
    body_color = [
    ],
}

var _screen_manifest := {
    screens = [
        preload("res://addons/scaffolder/src/gui/screens/about_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/data_agreement_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/developer_splash_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/game_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/game_over_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/godot_splash_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/level_select_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/main_menu_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/notification_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/pause_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/scaffolder_loading_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/settings_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/third_party_licenses_screen.tscn"),
        preload("res://addons/surfacer/src/gui/screens/precompute_platform_graphs_screen.tscn"),
        preload("res://addons/surfacer/src/gui/screens/surfacer_loading_screen.tscn"),
        preload("res://addons/scaffolder/src/gui/screens/confirm_data_deletion_screen_local.tscn"),
#        preload("res://addons/scaffolder/src/gui/screens/scaffolder_loading_screen.tscn"),
#        preload("res://addons/scaffolder/src/gui/screens/confirm_data_deletion_screen_with_analytics.tscn"),
#        preload("res://addons/scaffolder/src/gui/screens/rate_app_screen.tscn"),
    ],
    overlay_mask_transition_fade_in_texture = preload( \
            "res://addons/scaffolder/assets/images/transition_masks/radial_mask_transition_in.png"),
    overlay_mask_transition_fade_out_texture = preload( \
            "res://addons/scaffolder/assets/images/transition_masks/radial_mask_transition_in.png"),
    screen_mask_transition_fade_texture = preload( \
            "res://addons/scaffolder/assets/images/transition_masks/checkers_mask_transition.png"),
    overlay_mask_transition_class = OverlayMaskTransition,
    screen_mask_transition_class = ScreenMaskTransition,
    slide_transition_duration = 0.3,
    fade_transition_duration = 0.3,
    overlay_mask_transition_duration = 1.2,
    screen_mask_transition_duration = 1.2,
    slide_transition_easing = "ease_in_out",
    fade_transition_easing = "ease_in_out",
    overlay_mask_transition_fade_in_easing = "ease_out",
    overlay_mask_transition_fade_out_easing = "ease_in",
    screen_mask_transition_easing = "ease_in",
    default_transition_type = ScreenTransition.FADE,
    fancy_transition_type = ScreenTransition.SCREEN_MASK,
    overlay_mask_transition_color = Color("111111"),
    overlay_mask_transition_uses_pixel_snap = false,
    overlay_mask_transition_smooth_size = 0.02,
    screen_mask_transition_uses_pixel_snap = true,
    screen_mask_transition_smooth_size = 0.0,
}

var _gui_manifest := {
    debug_window_size = ScaffolderGuiConfig.SCREEN_RESOLUTIONS.full_screen,
    
    default_pc_game_area_size = Vector2(1024, 768),
    default_mobile_game_area_size = Vector2(500, 600),
    aspect_ratio_max = 2.0 / 1.0,
    aspect_ratio_min = 1.0 / 2.0,
    camera_smoothing_speed = 10.0,
    default_camera_zoom = 0.4,
    button_height = 56.0,
    button_width = 230.0,
    screen_body_width = 460.0,
    
    is_data_deletion_button_shown = true,
    
    is_suggested_button_shine_line_shown = true,
    is_suggested_button_color_pulse_shown = true,
    
    third_party_license_text = \
            ScaffolderThirdPartyLicenses.TEXT + \
            SurfacerThirdPartyLicenses.TEXT + \
            SquirrelAwayThirdPartyLicenses.TEXT,
    special_thanks_text = """
""",
    
    main_menu_image_scale = 1.0,
    game_over_image_scale = 0.5,
    loading_image_scale = 0.5,
    
    main_menu_image_scene = \
            preload("res://addons/squirrel_away/src/gui/squirrel_away_loading_image.tscn"),
    game_over_image_scene = \
            preload("res://addons/squirrel_away/src/gui/squirrel_away_loading_image.tscn"),
    loading_image_scene = \
            preload("res://addons/squirrel_away/src/gui/squirrel_away_loading_image.tscn"),
    welcome_panel_scene = \
            preload("res://addons/scaffolder/src/gui/welcome_panel.tscn"),
    debug_panel_scene = \
            preload("res://addons/scaffolder/src/gui/debug_panel.tscn"),
    
    theme = preload("res://addons/scaffolder/src/config/scaffolder_default_theme.tres"),
    
    fonts_manifest = _default_fonts_manifest_normal,
    settings_item_manifest = _settings_item_manifest,
    pause_item_manifest = _pause_item_manifest,
    game_over_item_manifest = _game_over_item_manifest,
    level_select_item_manifest = _level_select_item_manifest,
    hud_manifest = _hud_manifest,
    welcome_panel_manifest = _welcome_panel_manifest,
    screen_manifest = _screen_manifest,
    
    splash_scale_pc = 1.0,
    splash_scale_mobile = 0.77,
}

var _notifications_manifest := {
    duration_short_sec = 2.0,
    duration_long_sec = 8.0,
    
    fade_in_duration = 0.15,
    fade_out_duration = 0.3,
    
    size_small = Vector2(200.0, 67.0),
    size_medium = Vector2(400.0, 133.0),
    size_large = Vector2(600.0, 200.0),
    
    margin_bottom = 16.0,
    margin_sides = 16.0,
    
    opacity = 0.9,
    
    slide_in_displacement = Vector2(0.0, -67.0),
}

var _slow_motion_manifest := {
    time_scale = 0.02,
    tick_tock_tempo_multiplier = 25,
    saturation = 0.2,
}

var _input_map = ScaffolderProjectSettings.DEFAULT_INPUT_MAP

var _character_scenes := [
    preload("res://addons/squirrel_away/src/characters/cat/cat.tscn"),
    preload("res://addons/squirrel_away/src/characters/squirrel/squirrel.tscn"),
]


func _get_squirrel_collider_shape() -> Shape2D:
    var shape := CapsuleShape2D.new()
    shape.radius = 17.0
    shape.height = 9.0
    return shape


var _character_categories := [
    {
        name = "squirrels",
        characters = [
            "squirrel",
        ],
        # For a complete list of properties, see MovementParameters.
        movement_params = {
            collider_shape = _get_squirrel_collider_shape(),
            collider_rotation = PI / 2.0,
            
            can_grab_walls = true,
            can_grab_ceilings = true,
            can_jump = true,
            can_dash = false,
            can_double_jump = false,
            
            surface_speed_multiplier = 1.0,
            air_horizontal_speed_multiplier = 1.0,
            gravity_multiplier = 1.0,
            gravity_slow_rise_multiplier_multiplier = 1.0,
            gravity_double_jump_slow_rise_multiplier_multiplier = 1.0,
            walk_acceleration_multiplier = 1.4,
            in_air_horizontal_acceleration_multiplier = 1.4,
            climb_up_speed_multiplier = 1.5,
            climb_down_speed_multiplier = 1.5,
            ceiling_crawl_speed_multiplier = 1.5,
            friction_coefficient_multiplier = 1.0,
            jump_boost_multiplier = 1.2,
            wall_jump_horizontal_boost_multiplier = 1.0,
            wall_fall_horizontal_boost_multiplier = 1.0,
            max_horizontal_speed_default_multiplier = 1.4,
            max_vertical_speed_multiplier = 1.0,
            
            uses_duration_instead_of_distance_for_edge_weight = true,
            additional_edge_weight_offset_override = -1.0,
            walking_edge_weight_multiplier_override = -1.0,
            ceiling_crawling_edge_weight_multiplier_override = -1.0,
            climbing_edge_weight_multiplier_override = -1.0,
            climb_to_adjacent_surface_edge_weight_multiplier_override = -1.0,
            move_to_collinear_surface_edge_weight_multiplier_override = -1.0,
            air_edge_weight_multiplier_override = -1.0,
            
            minimizes_velocity_change_when_jumping = false,
            optimizes_edge_jump_positions_at_run_time = true,
            optimizes_edge_land_positions_at_run_time = true,
            also_optimizes_preselection_path = true,
            forces_character_position_to_match_edge_at_start = true,
            forces_character_velocity_to_match_edge_at_start = true,
            forces_character_position_to_match_path_at_end = false,
            forces_character_velocity_to_zero_at_path_end = false,
            syncs_character_position_to_edge_trajectory = true,
            syncs_character_velocity_to_edge_trajectory = true,
            includes_continuous_trajectory_positions = true,
            includes_continuous_trajectory_velocities = true,
            includes_discrete_trajectory_state = false,
            is_trajectory_state_stored_at_build_time = false,
            bypasses_runtime_physics = false,
            default_nav_interrupt_resolution_mode = \
                    NavigationInterruptionResolution.FORCE_EXPECTED_STATE,
            min_intra_surface_distance_to_optimize_jump_for = 16.0,
            dist_sq_thres_for_considering_additional_jump_land_points = \
                    32.0 * 32.0,
            stops_after_finding_first_valid_edge_for_a_surface_pair = false,
            calculates_all_valid_edges_for_a_surface_pair = false,
            always_includes_jump_land_positions_at_surface_ends = false,
            includes_redundant_j_l_positions_with_zero_start_velocity = true,
            normal_jump_instruction_duration_increase = 0.08,
            exceptional_jump_instruction_duration_increase = 0.2,
            recurses_when_colliding_during_horizontal_step_calculations = true,
            backtracks_for_higher_jumps_during_hor_step_calculations = true,
            collision_margin_for_edge_calculations = 1.0,
            collision_margin_for_waypoint_positions = 4.0,
            skips_less_likely_jump_land_positions = false,
            reached_in_air_destination_distance_squared_threshold = \
                    16.0 * 16.0,
            max_edges_to_remove_from_path_for_opt_to_in_air_dest = 2,
            always_tries_to_face_direction_of_motion = true,
            max_distance_for_reachable_surface_tracking = 1024.0,
        },
    },
]

var _character_manifest := {
    default_character_name = "cat",
    character_scenes = _character_scenes,
    character_categories = _character_categories,
    omits_npcs = false,
}

var _annotation_parameters_manifest := {
}

var _additional_metric_keys := [
    "start_new_squirrel_navigation",
]

var _surfacer_debug_params := {}

var _annotations_manifest := {
    is_player_preselection_trajectory_shown = true,
    
    is_player_slow_mo_trajectory_shown = false,
    is_player_non_slow_mo_trajectory_shown = true,
    is_player_previous_trajectory_shown = false,
    is_player_navigation_destination_shown = true,
    is_player_nav_pulse_shown = false,
    
    is_npc_slow_mo_trajectory_shown = true,
    is_npc_non_slow_mo_trajectory_shown = false,
    is_npc_previous_trajectory_shown = false,
    is_npc_navigation_destination_shown = false,
    is_npc_nav_pulse_shown = true,
    
    does_player_nav_pulse_grow = false,
    is_player_prediction_shown = true,
    
    does_npc_nav_pulse_grow = true,
    is_npc_prediction_shown = true,
    
    nav_selection_prediction_opacity = 0.5,
    nav_selection_prediction_tween_duration = 0.15,
    new_path_pulse_duration = 0.7,
    new_path_pulse_time_length = 1.0,
}

var _surface_properties_manifest := {
    "default": {
        can_grab = true,
        friction_multiplier = 0.7,
        speed_multiplier = 1.0,
    },
    "disabled": {
        can_grab = false,
    },
    "slippery": {
        friction_multiplier = 0.05,
    },
    "sticky": {
        friction_multiplier = 4.0,
    },
    "fast": {
        speed_multiplier = 4.0,
    },
    "slow": {
        speed_multiplier = 0.2,
    },
}

var _subtile_manifest := {
    autotile_name_prefix = "autotile_",
    forces_convex_collision_shapes = true,
    allows_partial_matches = true,
    supports_runtime_autotiling = true,
    
    corner_type_annotation_key_path = \
            "res://addons/surface_tiler/assets/images/corner_type_annotation_key.png",
    
    tile_set_image_parser_class = \
            preload("res://addons/surface_tiler/src/tile_set_image_parser.gd"),
    subtile_target_corner_calculator_class = \
            preload("res://addons/surface_tiler/src/subtile_target_corner_calculator.gd"),
    initializer_class = \
            preload("res://addons/surface_tiler/src/corner_match_tileset_initializer.gd"),
    shape_calculator_class = \
            preload("res://addons/surface_tiler/src/corner_match_tileset_shape_calculator.gd"),
    
    # FIXME: LEFT OFF HERE: -------
    # - Use this new tile-set config structure.
    tile_sets = [
        {
            tile_set_quadrants_path = \
                    "res://addons/surface_tiler/assets/images/tileset_quadrants.png",
            tile_set_corner_type_annotations_path = \
                    "res://addons/surface_tiler/assets/images/tileset_corner_type_annotations.png",
            tile_set = \
                    preload("res://addons/squirrel_away/src/tiles/squirrel_away_tile_set_with_many_angles.tres"),
            quadrant_size = 16,
            subtile_collision_margin = 3.0,
            are_45_degree_subtiles_used = true,
            are_27_degree_subtiles_used = false,
        },
    ],
    
    corner_types_to_swap_for_bottom_quadrants = [
        [SubtileCorner.EXT_45_FLOOR, SubtileCorner.EXT_45_CEILING],
        [SubtileCorner.EXT_INT_45_FLOOR, SubtileCorner.EXT_INT_45_CEILING],
        [SubtileCorner.INT_45_FLOOR, SubtileCorner.INT_45_CEILING],
    ],
}

# FIXME: LEFT OFF HERE: --------------------------------------------
var _tileset_manifest := {
    tilesets = [
        {
            tiles = [
                {
                    name = "0_tile_with_90s",
                    angle = CellAngleType.A90,
                    properties = "",
                    is_collidable = true,
                },
                {
                    name = "1_tile_with_45s",
                    angle = CellAngleType.A45,
                    properties = "",
                    is_collidable = true,
                },
                {
                    name = "2_tile_with_27s",
                    angle = CellAngleType.A27,
                    properties = "",
                    is_collidable = true,
                },
                {
                    name = "ungrabbable_tile",
                    angle = CellAngleType.A90,
                    properties = "disabled",
                    is_collidable = true,
                },
                {
                    name = "slippery_tile",
                    angle = CellAngleType.A90,
                    properties = "slippery",
                    is_collidable = true,
                },
                {
                    name = "sticky_tile",
                    angle = CellAngleType.A90,
                    properties = "sticky",
                    is_collidable = true,
                },
                {
                    name = "fast_tile",
                    angle = CellAngleType.A90,
                    properties = "fast",
                    is_collidable = true,
                },
                {
                    name = "slow_tile",
                    angle = CellAngleType.A90,
                    properties = "slow",
                    is_collidable = true,
                },
                
                # FIXME: ----------------- REMOVE
                {
                    name = "0_tile_with_90s_old",
                    angle = CellAngleType.A90,
                    properties = "",
                    is_collidable = true,
                },
                {
                    name = "1_tile_with_45s_old",
                    angle = CellAngleType.A45,
                    properties = "",
                    is_collidable = true,
                },
            ],
        },
    ],
}

var _movement_manifest := {
    uses_point_and_click_navigation = true,
    cancels_point_and_click_nav_on_key_press = true,
    
    gravity_default = 5000.0,
    gravity_slow_rise_multiplier_default = 0.38,
    gravity_double_jump_slow_rise_multiplier_default = 0.68,
    walk_acceleration_default = 8000.0,
    in_air_horizontal_acceleration_default = 2500.0,
    climb_up_speed_default = -230.0,
    climb_down_speed_default = 120.0,
    ceiling_crawl_speed_default = 230.0,
    friction_coeff_with_sideways_input_default = 1.0,
    friction_coeff_without_sideways_input_default = 1.25,
    jump_boost_default = -900.0,
    wall_jump_horizontal_boost_default = 200.0,
    wall_fall_horizontal_boost_default = 20.0,
    
    max_horizontal_speed_default_default = 320.0,
    max_vertical_speed_default = 2800.0,
    min_horizontal_speed = 5.0,
    min_vertical_speed = 0.0,
    
    dash_speed_multiplier_default = 3.0,
    dash_vertical_boost_default = -300.0,
    dash_duration_default = 0.3,
    dash_fade_duration_default = 0.1,
    dash_cooldown_default = 1.0,
    
    additional_edge_weight_offset_default = 0.0,
    walking_edge_weight_multiplier_default = 1.2,
    ceiling_crawling_edge_weight_multiplier_default = 2.0,
    climbing_edge_weight_multiplier_default = 1.8,
    climb_to_adjacent_surface_edge_weight_multiplier_default = 1.0,
    move_to_collinear_surface_edge_weight_multiplier_default = 0.0,
    air_edge_weight_multiplier_default = 1.0,
    
    action_handler_classes = \
            SurfacerMovementManifest.DEFAULT_ACTION_HANDLER_CLASSES,
    edge_calculator_classes = \
            SurfacerMovementManifest.DEFAULT_EDGE_CALCULATOR_CLASSES,
}

var _surfacer_manifest := {
    are_oddly_shaped_surfaces_used = true,
    
    precompute_platform_graph_for_levels = [],
    ignores_platform_graph_save_files = false,
    ignores_platform_graph_save_file_trajectory_state = false,
    is_debug_only_platform_graph_state_included = false,
    are_reachable_surfaces_per_player_tracked = true,
    are_loaded_surfaces_deeply_validated = true,
    uses_threads_for_platform_graph_calculation = false and _uses_threads,
    
    default_tile_set = preload( \
            "res://addons/surfacer/src/tiles/tile_set_with_many_angles.tres"),
    path_drag_update_throttle_interval = 0.2,
    path_beat_update_throttle_interval = 0.2,
    
    # Params for CameraPanController.
    snaps_camera_back_to_character = true,
    max_zoom_multiplier_from_pointer = 1.5,
    max_pan_distance_from_pointer = 512.0,
    duration_to_max_pan_from_pointer_at_max_control = 0.67,
    duration_to_max_zoom_from_pointer_at_max_control = 3.0,
    screen_size_ratio_distance_from_edge_to_start_pan_from_pointer = 0.16,
    
    skip_choreography_framerate_multiplier = 4.0,
    
    debug_params = _surfacer_debug_params,
    
    surface_properties_manifest = _surface_properties_manifest,
    movement_manifest = _movement_manifest,
    annotations_manifest = _annotations_manifest,
    subtile_manifest = _subtile_manifest,
}

var app_manifest := {
    metadata = _metadata,
    audio_manifest = _audio_manifest,
    colors_manifest = _colors_manifest,
    styles_manifest = _default_styles_manifest_normal,
    images_manifest = _default_images_manifest_normal,
    gui_manifest = _gui_manifest,
    notifications_manifest = _notifications_manifest,
    slow_motion_manifest = _slow_motion_manifest,
    input_map = _input_map,
    character_manifest = _character_manifest,
    annotation_parameters_manifest = _annotation_parameters_manifest,
    surfacer_manifest = _surfacer_manifest,

    level_config_class = SquirrelAwayLevelConfig,
    level_session_class = SquirrelAwayLevelSession,
    annotators_class = SurfacerAnnotators,
}

var _overrides := {
    images_manifest = _images_overrides,
}

# ---


func _init() -> void:
    assert(self.get_script().resource_path.find("addons/squirrel_away") >= 0,
            "Squirrel Away must be run as an 'addon' from within a separate " +
            "project.")


func _ready() -> void:
    Sc.call_deferred("run", app_manifest)


func _override_configs_for_app() -> void:
    ._override_configs_for_app()
    
    if _is_using_pixel_style:
        app_manifest.gui_manifest.fonts_manifest = \
                _default_fonts_manifest_pixel
        app_manifest.styles_manifest = _styles_manifest_pixel
        app_manifest.images_manifest = _default_images_manifest_pixel
    else:
        app_manifest.gui_manifest.fonts_manifest = \
                _default_fonts_manifest_normal
        app_manifest.styles_manifest = _default_styles_manifest_normal
        app_manifest.images_manifest = _default_images_manifest_normal
    
    _override_manifest(app_manifest, _overrides)


func _configure_sub_modules() -> void:
    Sc.profiler.preregister_metric_keys(_additional_metric_keys)


func _load_state() -> void:
    ._load_state()
