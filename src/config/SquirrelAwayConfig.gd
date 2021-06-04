class_name SquirrelAwayConfig
extends Node


var _debug := OS.is_debug_build()
#var _debug := false
var _playtest := true
#var _playtest := false
var _uses_threads := true and OS.can_use_threads()

# Useful for getting screenshots at specific resolutions.
var _screen_resolutions := {
    # Should match Project Settings > Display > Window > Size > Width/Height
    default = Vector2(1024, 768),
    full_screen = Vector2.INF,
    play_store = Vector2(3840, 2160),
    iphone_6_5 = Vector2(2778, 1284),
    iphone_5_5 = Vector2(2208, 1242),
    ipad_12_9 = Vector2(2732, 2048),
    google_ads_landscape = Vector2(1024, 768),
    google_ads_portrait = Vector2(768, 1024),
}

var group_name_squirrel_destinations := "squirrel_destinations"

var _fonts := {
    main_xs = preload( \
            "res://addons/scaffolder/assets/fonts/main_font_xs.tres"),
    main_xs_italic = preload( \
            "res://addons/scaffolder/assets/fonts/main_font_xs_italic.tres"),
    main_s = preload( \
            "res://addons/scaffolder/assets/fonts/main_font_s.tres"),
    main_m = preload( \
            "res://addons/scaffolder/assets/fonts/main_font_m.tres"),
    main_m_bold = preload( \
            "res://addons/scaffolder/assets/fonts/main_font_m_bold.tres"),
    main_m_italic = preload( \
            "res://addons/scaffolder/assets/fonts/main_font_m_italic.tres"),
    main_l = preload( \
            "res://addons/scaffolder/assets/fonts/main_font_l.tres"),
    main_xl = preload( \
            "res://addons/scaffolder/assets/fonts/main_font_xl.tres"),
    
    header_s = preload( \
            "res://addons/scaffolder/assets/fonts/header_font_s.tres"),
    header_m = preload( \
            "res://addons/scaffolder/assets/fonts/header_font_m.tres"),
    header_l = preload( \
            "res://addons/scaffolder/assets/fonts/header_font_l.tres"),
    header_xl = preload( \
            "res://addons/scaffolder/assets/fonts/header_font_xl.tres"),
}

var _sounds_manifest := [
    {
        name = "fall",
        volume_db = 18.0,
        path_prefix = "res://addons/scaffolder/assets/sounds/",
    },
    {
        name = "cadence",
        volume_db = 8.0,
        path_prefix = "res://addons/scaffolder/assets/sounds/",
    },
    {
        name = "jump",
        volume_db = -6.0,
        path_prefix = "res://addons/scaffolder/assets/sounds/",
    },
    {
        name = "land",
        volume_db = -0.0,
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
        volume_db = 0.0,
        bpm = 150.0,
        meter = 4,
    },
    {
        name = "pause_menu",
        volume_db = 0.0,
        bpm = 112.5,
        meter = 4,
    },
]

var _colors_manifest := {
    # Scaffolder colors.
    
    # Should match Project Settings > Application > Boot Splash > Bg Color
    # Should match Project Settings > Rendering > Environment > Default Clear Color
    background = Color("473d2d"),
    font = Color("eeeeee"),
    header_font = Color("eeeeee"),
    button = Color("3e7025"),
    shiny_button_highlight = Color("72d113"),
    button_disabled_hsv_delta = {h=0.0, s=-0.4, v=0.15, a=-0.2},
    button_focused_hsv_delta = {h=-0.03, s=-0.15, v=0.15},
    button_hover_hsv_delta = {h=-0.03, s=-0.15, v=0.15},
    button_pressed_hsv_delta = {h=0.05, s=-0.05, v=-0.1},
    dropdown = Color("473d2d"),
    tooltip = Color("080808"),
    tooltip_bg = Color("bbbbbb"),
    dropdown_disabled_hsv_delta = {h=0.0, s=-0.4, v=0.15, a=-0.2},
    dropdown_focused_hsv_delta = {h=0.05, s=-0.15, v=0.15},
    dropdown_hover_hsv_delta = {h=0.05, s=-0.15, v=0.15},
    dropdown_pressed_hsv_delta = {h=-0.05, s=-0.05, v=-0.1},
    popup_background_hsv_delta = {h=0.0, s=-0.05, v=0.05},
    scroll_bar_background_hsv_delta = {h=0.0, s=-0.2, v=-0.1},
    scroll_bar_grabber_normal_hsv_delta = {h=0.05, s=-0.2, v=-0.1},
    scroll_bar_grabber_hover_hsv_delta = {h=0.0, s=0.15, v=0.2},
    scroll_bar_grabber_pressed_hsv_delta = {h=0.08, s=-0.15, v=-0.1},
    zebra_stripe_even_row_hsv_delta = {h=0.01, s=-0.05, v=0.05},
    
    # Surfacer colors.
    
    click = ScaffolderColors.static_opacify(
            SurfacerColors.WHITE, ScaffolderColors.ALPHA_SLIGHTLY_FAINT),
    surface_click_selection = ScaffolderColors.static_opacify(
            SurfacerColors.WHITE, ScaffolderColors.ALPHA_SOLID),
    grid_indices = ScaffolderColors.static_opacify(
            SurfacerColors.WHITE, ScaffolderColors.ALPHA_FAINT),
    ruler = SurfacerColors.WHITE,
    invalid = SurfacerColors.RED,
    human_navigation = Color("40ff00"),
    computer_navigation = Color("ff8000"),
    player_position = Color("00db0b"),
    recent_movement = Color("ffda85"),
    inspector_origin = ScaffolderColors.static_opacify(
            SurfacerColors.ORANGE, ScaffolderColors.ALPHA_FAINT),
}

var _styles_manifest := {
    button_corner_radius = 4,
    button_corner_detail = 3,
    button_shadow_size = 3,
    
    dropdown_corner_radius = 4,
    dropdown_corner_detail = 3,
    
    scroll_corner_radius = 6,
    scroll_corner_detail = 3,
    # Width of the scrollbar.
    scroll_content_margin = 7,
    
    scroll_grabber_corner_radius = 8,
    scroll_grabber_corner_detail = 3,
}

var _metric_keys := [
    "start_new_squirrel_navigation",
]

var _debug_params := {
#    limit_parsing = {
#        player_name = "cat",
#
#        edge_type = EdgeType.JUMP_INTER_SURFACE_EDGE,
##        edge_type = EdgeType.CLIMB_OVER_WALL_TO_FLOOR_EDGE,
##        edge_type = EdgeType.FALL_FROM_WALL_EDGE,
##        edge_type = EdgeType.FALL_FROM_FLOOR_EDGE,
##        edge_type = EdgeType.CLIMB_DOWN_WALL_TO_FLOOR_EDGE,
##        edge_type = EdgeType.WALK_TO_ASCEND_WALL_FROM_FLOOR_EDGE,
#
#        edge = {
#            origin = {
#                surface_side = SurfaceSide.FLOOR,
#                surface_start_vertex = Vector2(-64, 64),
#                position = Vector2(64, 64),
#                epsilon = 10,
#            },
#            destination = {
#                surface_side = SurfaceSide.FLOOR,
#                surface_start_vertex = Vector2(128, -128),
#                position = Vector2(128, -128),
#                epsilon = 10,
#            },
#            #velocity_start = Vector2(0, -1000),
#        },
#    },
    extra_annotations = {},
}

var _player_action_classes := [
    preload("res://addons/surfacer/src/player/action/action_handlers/AirDashAction.gd"),
    preload("res://addons/surfacer/src/player/action/action_handlers/AirDefaultAction.gd"),
    preload("res://addons/surfacer/src/player/action/action_handlers/AirJumpAction.gd"),
    preload("res://addons/surfacer/src/player/action/action_handlers/AllDefaultAction.gd"),
    preload("res://addons/surfacer/src/player/action/action_handlers/CapVelocityAction.gd"),
    preload("res://addons/surfacer/src/player/action/action_handlers/FloorDashAction.gd"),
    preload("res://addons/surfacer/src/player/action/action_handlers/FloorDefaultAction.gd"),
    preload("res://addons/surfacer/src/player/action/action_handlers/FallThroughFloorAction.gd"),
    preload("res://addons/surfacer/src/player/action/action_handlers/FloorFrictionAction.gd"),
    preload("res://addons/surfacer/src/player/action/action_handlers/FloorJumpAction.gd"),
    preload("res://addons/surfacer/src/player/action/action_handlers/FloorWalkAction.gd"),
    preload("res://addons/surfacer/src/player/action/action_handlers/MatchExpectedEdgeTrajectoryAction.gd"),
    preload("res://addons/surfacer/src/player/action/action_handlers/WallClimbAction.gd"),
    preload("res://addons/surfacer/src/player/action/action_handlers/WallDashAction.gd"),
    preload("res://addons/surfacer/src/player/action/action_handlers/WallDefaultAction.gd"),
    preload("res://addons/surfacer/src/player/action/action_handlers/WallFallAction.gd"),
    preload("res://addons/surfacer/src/player/action/action_handlers/WallJumpAction.gd"),
    preload("res://addons/surfacer/src/player/action/action_handlers/WallWalkAction.gd"),
]

var _edge_movement_classes := [
    preload("res://addons/surfacer/src/platform_graph/edge/calculators/FromAirCalculator.gd"),
    preload("res://addons/surfacer/src/platform_graph/edge/calculators/ClimbDownWallToFloorCalculator.gd"),
    preload("res://addons/surfacer/src/platform_graph/edge/calculators/ClimbOverWallToFloorCalculator.gd"),
    preload("res://addons/surfacer/src/platform_graph/edge/calculators/FallFromFloorCalculator.gd"),
    preload("res://addons/surfacer/src/platform_graph/edge/calculators/FallFromWallCalculator.gd"),
    preload("res://addons/surfacer/src/platform_graph/edge/calculators/JumpFromSurfaceCalculator.gd"),
    preload("res://addons/surfacer/src/platform_graph/edge/calculators/WalkToAscendWallFromFloorCalculator.gd"),
]

var _player_param_classes := [
    preload("res://src/players/cat/CatParams.gd"),
    preload("res://src/players/squirrel/SquirrelParams.gd"),
#    preload("res://test/data/TestPlayerParams.gd"),
]

var app_manifest := {
    # TODO: Remember to reset these when creating releases.
    precompute_platform_graph_for_levels = [
#        "3",
#        "4",
#        "6",
#        "7",
    ],
#    ignores_platform_graph_save_files = true,
    ignores_platform_graph_save_files = false,
    debug = _debug,
#    debug = false
    playtest = _playtest,
    pauses_on_focus_out = false,
#    pauses_on_focus_out = true,
    also_prints_to_stdout = true and _debug,
    is_profiler_enabled = true,
    are_all_levels_unlocked = true,
    is_splash_skipped = _debug,
    are_loaded_surfaces_deeply_validated = true,
    is_inspector_enabled_default = true or _debug or _playtest,
    inspector_panel_starts_open = false,
#    debug_window_size = _screen_resolutions.default,
    debug_window_size = _screen_resolutions.full_screen,
    uses_threads = _uses_threads,
    uses_threads_for_platform_graph_calculation = false and _uses_threads,
    thread_count = OS.get_processor_count() if _uses_threads else 1,
    is_mobile_supported = true,
    is_data_deletion_button_shown = false,
    is_music_speed_change_supported = false,
    is_music_speed_scaled_with_time_scale = false,
    is_music_speed_scaled_with_additional_debug_time_scale = true,
    default_player_name = 'cat',
    nav_selection_slow_mo_time_scale = 0.02,
    nav_selection_slow_mo_tick_tock_tempo_multiplier = 50,
    nav_selection_slow_mo_saturation = 0.2,
    nav_selection_prediction_opacity = 0.5,
    nav_selection_prediction_tween_duration = 0.15,
    new_path_pulse_duration_multiplier = 0.3,
    new_path_pulse_time_length = 1.0,
    
    # Params for CameraPanController.
    snaps_camera_back_to_player = true,
    max_zoom_multiplier_from_pointer = 1.5,
    max_pan_distance_from_pointer = 512.0,
    duration_to_max_pan_from_pointer_at_max_control = 0.67,
    duration_to_max_zoom_from_pointer_at_max_control = 3.0,
    screen_size_ratio_distance_from_edge_to_start_pan_from_pointer = 0.3,
    
    is_human_current_nav_trajectory_shown_with_slow_mo = false,
    is_computer_current_nav_trajectory_shown_with_slow_mo = true,
    is_human_current_nav_trajectory_shown_without_slow_mo = true,
    is_computer_current_nav_trajectory_shown_without_slow_mo = false,
    is_human_nav_pulse_shown_with_slow_mo = false,
    is_computer_nav_pulse_shown_with_slow_mo = true,
    is_human_nav_pulse_shown_without_slow_mo = true,
    is_computer_nav_pulse_shown_without_slow_mo = false,
    is_human_new_nav_exclamation_mark_shown = false,
    is_computer_new_nav_exclamation_mark_shown = true,
    does_human_nav_pulse_grow = false,
    does_computer_nav_pulse_grow = true,
    is_human_prediction_shown = true,
    is_computer_prediction_shown = true,
    
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
    
    theme = preload("res://src/config/default_theme.tres"),
    
    screen_path_exclusions = [
        "res://addons/scaffolder/src/gui/screens/RateAppScreen.tscn",
        "res://addons/scaffolder/src/gui/screens/ConfirmDataDeletionScreen.tscn",
    ],
    screen_path_inclusions = [],
    settings_main_item_class_exclusions = [],
    settings_main_item_class_inclusions = [],
    settings_details_item_class_exclusions = [],
    settings_details_item_class_inclusions = [],
    pause_item_class_exclusions = [],
    pause_item_class_inclusions = [],
    game_over_item_class_exclusions = [],
    game_over_item_class_inclusions = [],
    level_select_item_class_exclusions = [],
    level_select_item_class_inclusions = [],
    
    colors_class = SurfacerColors,
    draw_utils_class = SurfacerDrawUtils,
    level_config_class = SquirrelAwayLevelConfig,
    
    fonts = _fonts,
    
    sounds_manifest = _sounds_manifest,
    default_sounds_path_prefix = "res://assets/sounds/",
    default_sounds_file_suffix = ".wav",
    default_sounds_bus_index = 1,
    music_manifest = _music_manifest,
    default_music_path_prefix = "res://addons/scaffolder/assets/music/",
    default_music_file_suffix = ".ogg",
    default_music_bus_index = 2,
    
    colors_manifest = _colors_manifest,
    styles_manifest = _styles_manifest,
    
    debug_params = _debug_params,
    player_action_classes = _player_action_classes,
    edge_movement_classes = _edge_movement_classes,
    player_param_classes = _player_param_classes,
    
    pauses_level_music_on_pause = true,
    main_menu_music = "on_a_quest",
    game_over_music = "on_a_quest",
    pause_menu_music = "pause_menu",
    default_level_music = "on_a_quest",
    godot_splash_sound = "achievement",
    developer_splash_sound = "single_cat_snore",
    level_end_sound = "cadence",
    
    third_party_license_text = \
            ScaffolderThirdPartyLicenses.TEXT + \
            SurfacerThirdPartyLicenses.TEXT + \
            SquirrelAwayThirdPartyLicenses.TEXT,
    special_thanks_text = """
""",
    
    app_logo = preload("res://assets/images/gui/logo.png"),
    app_logo_scale = 2.0,
    go_icon = preload("res://assets/images/gui/go_icon.png"),
    go_icon_scale = 1.5,
    developer_name = "Snoring Cat LLC",
    developer_url = "https://snoringcat.games",
    
    developer_logo = preload( \
            "res://addons/scaffolder/assets/images/gui/snoring_cat_logo_about.png"),
    developer_splash = preload( \
            "res://addons/scaffolder/assets/images/gui/snoring_cat_logo_splash.png"),
    
    godot_splash_screen_duration = 0.8,
    developer_splash_screen_duration = 1.0,
    
    main_menu_image_scene_path = "res://src/gui/LoadingImage.tscn",
    loading_image_scene_path = "res://src/gui/LoadingImage.tscn",
    welcome_panel_resource_path = ScaffolderConfig.WELCOME_PANEL_RESOURCE_PATH,
    
    fade_in_transition_texture = \
            preload("res://addons/scaffolder/assets/images/transition_in.png"),
    fade_out_transition_texture = \
            preload("res://addons/scaffolder/assets/images/transition_out.png"),
    
    cell_size = Vector2(64.0, 64.0),
    
    # Should match Project Settings > Display > Window > Size > Width/Height
    default_game_area_size = Vector2(1024, 768),
    aspect_ratio_max = 2.0 / 1.0,
    aspect_ratio_min = 1.0 / 2.0,
    camera_smoothing_speed = 10.0,
    default_camera_zoom = 1.0,
    uses_level_scores = true,
}


func initialize() -> void:
    Gs.profiler.preregister_metric_keys(_metric_keys)
