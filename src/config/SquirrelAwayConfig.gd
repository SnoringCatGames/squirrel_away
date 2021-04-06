class_name SquirrelAwayConfig
extends Node

var _debug := OS.is_debug_build()
var _playtest := true
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
    main_xs = preload("res://addons/godot_scaffold/assets/fonts/main_font_xs.tres"),
    main_xs_italic = preload( \
            "res://addons/godot_scaffold/assets/fonts/main_font_xs_italic.tres"),
    main_s = preload("res://addons/godot_scaffold/assets/fonts/main_font_s.tres"),
    main_m = preload("res://addons/godot_scaffold/assets/fonts/main_font_m.tres"),
    main_m_bold = preload( \
            "res://addons/godot_scaffold/assets/fonts/main_font_m_bold.tres"),
    main_m_italic = preload( \
            "res://addons/godot_scaffold/assets/fonts/main_font_m_italic.tres"),
    main_l = preload("res://addons/godot_scaffold/assets/fonts/main_font_l.tres"),
    main_xl = preload("res://addons/godot_scaffold/assets/fonts/main_font_xl.tres"),
}

var _sounds_manifest := [
    {
        name = "fall",
        volume_db = 18.0,
        path_prefix = "res://addons/godot_scaffold/assets/sounds/",
    },
    {
        name = "cadence",
        volume_db = 8.0,
        path_prefix = "res://addons/godot_scaffold/assets/sounds/",
    },
    {
        name = "jump",
        volume_db = -6.0,
        path_prefix = "res://addons/godot_scaffold/assets/sounds/",
    },
    {
        name = "land",
        volume_db = -0.0,
        path_prefix = "res://addons/godot_scaffold/assets/sounds/",
    },
    {
        name = "menu_select",
        volume_db = -2.0,
        path_prefix = "res://addons/godot_scaffold/assets/sounds/",
    },
    {
        name = "menu_select_fancy",
        volume_db = -6.0,
        path_prefix = "res://addons/godot_scaffold/assets/sounds/",
    },
    {
        name = "lock_low",
        volume_db = 0.0,
        path_prefix = "res://addons/godot_scaffold/assets/sounds/",
    },
    {
        name = "lock_high",
        volume_db = 0.0,
        path_prefix = "res://addons/godot_scaffold/assets/sounds/",
    },
    {
        name = "walk",
        volume_db = 15.0,
        path_prefix = "res://addons/godot_scaffold/assets/sounds/",
    },
    {
        name = "achievement",
        volume_db = 12.0,
        path_prefix = "res://addons/godot_scaffold/assets/sounds/",
    },
    {
        name = "single_cat_snore",
        volume_db = 17.0,
        path_prefix = "res://addons/godot_scaffold/assets/sounds/",
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
    },
]

var _colors_manifest := {
    # Should match Project Settings > Application > Boot Splash > Bg Color
    # Should match Project Settings > Rendering > Environment > Default Clear Color
    background_color = Color("473d2d"),
    font_color = Color("eeeeee"),
    header_font_color = Color("eeeeee"),
    button_color = Color("3e7025"),
    shiny_button_highlight_color = Color("72d113"),
    button_disabled_hsv_delta = {h=0.0, s=-0.4, v=0.15, a=-0.2},
    button_focused_hsv_delta = {h=-0.03, s=-0.15, v=0.15},
    button_hover_hsv_delta = {h=-0.03, s=-0.15, v=0.15},
    button_pressed_hsv_delta = {h=0.05, s=-0.05, v=-0.1},
    dropdown_color = Color("473d2d"),
    dropdown_disabled_hsv_delta = {h=0.0, s=-0.4, v=0.15, a=-0.2},
    dropdown_focused_hsv_delta = {h=0.05, s=-0.15, v=0.15},
    dropdown_hover_hsv_delta = {h=0.05, s=-0.15, v=0.15},
    dropdown_pressed_hsv_delta = {h=-0.05, s=-0.05, v=-0.1},
    popup_background_hsv_delta = {h=0.0, s=-0.05, v=0.05},
    scroll_bar_background_hsv_delta = {h=0.0, s=-0.2, v=-0.1},
    scroll_bar_grabber_normal_hsv_delta = {h=0.05, s=-0.2, v=-0.1},
    scroll_bar_grabber_hover_hsv_delta = {h=0.0, s=0.15, v=0.2},
    scroll_bar_grabber_pressed_hsv_delta = {h=0.08, s=-0.15, v=-0.1},
    zebra_stripe_even_row_color_hsv_delta = {h=0.01, s=-0.05, v=0.05},
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
#        edge_type = EdgeType.CLIMB_OVER_WALL_TO_FLOOR_EDGE,
#        edge_type = EdgeType.FALL_FROM_WALL_EDGE,
#        edge_type = EdgeType.FALL_FROM_FLOOR_EDGE,
#        edge_type = EdgeType.JUMP_INTER_SURFACE_EDGE,
#        edge_type = EdgeType.CLIMB_DOWN_WALL_TO_FLOOR_EDGE,
#        edge_type = EdgeType.WALK_TO_ASCEND_WALL_FROM_FLOOR_EDGE,
#        
#        edge = {
#            origin = {
#                surface_side = SurfaceSide.RIGHT_WALL,
#                surface_start_vertex = Vector2(64, 768),
#                #position = Vector2(64, 704),
#                epsilon = 10,
#            },
#            destination = {
#                surface_side = SurfaceSide.LEFT_WALL,
#                surface_start_vertex = Vector2(-384, 704),
#                #position = Vector2(-384, 737),
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
    preload("res://addons/surfacer/src/platform_graph/edge/calculators/AirToSurfaceCalculator.gd"),
    preload("res://addons/surfacer/src/platform_graph/edge/calculators/ClimbDownWallToFloorCalculator.gd"),
    preload("res://addons/surfacer/src/platform_graph/edge/calculators/ClimbOverWallToFloorCalculator.gd"),
    preload("res://addons/surfacer/src/platform_graph/edge/calculators/FallFromFloorCalculator.gd"),
    preload("res://addons/surfacer/src/platform_graph/edge/calculators/FallFromWallCalculator.gd"),
    preload("res://addons/surfacer/src/platform_graph/edge/calculators/JumpInterSurfaceCalculator.gd"),
    preload("res://addons/surfacer/src/platform_graph/edge/calculators/JumpFromSurfaceToAirCalculator.gd"),
    preload("res://addons/surfacer/src/platform_graph/edge/calculators/WalkToAscendWallFromFloorCalculator.gd"),
]

var _player_param_classes := [
    preload("res://src/players/cat/CatParams.gd"),
    preload("res://src/players/squirrel/SquirrelParams.gd"),
#    preload("res://test/data/TestPlayerParams.gd"),
]

var app_manifest := {
    # TODO: Remember to reset these when creating releases.
    debug = _debug,
    #debug = false
    playtest = _playtest,
    also_prints_to_stdout = true and _debug,
    is_profiler_enabled = _debug or _playtest,
    are_all_levels_unlocked = true,
    is_inspector_enabled_default = true or _debug or _playtest,
    inspector_panel_starts_open = false,
    debug_window_size = _screen_resolutions.full_screen,
    uses_threads = _uses_threads,
    uses_threads_for_platform_graph_calculation = false and _uses_threads,
    thread_count = OS.get_processor_count() if _uses_threads else 1,
    is_mobile_supported = true,
    is_data_deletion_button_shown = false,
    
    app_name = "Squirrel Away",
    app_id = "games.snoringcat.squirrel_away",
    app_version = "0.0.1",
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
    
    screen_filename_exclusions = [
        "RateAppScreen.tscn",
        "ConfirmDataDeletionScreen.tscn",
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
    
    draw_utils_class = SurfacerDrawUtils,
    level_config_class = SquirrelAwayLevelConfig,
    
    fonts = _fonts,
    
    sounds_manifest = _sounds_manifest,
    default_sounds_path_prefix = "res://assets/sounds/",
    default_sounds_file_suffix = ".wav",
    default_sounds_bus_index = 1,
    music_manifest = _music_manifest,
    default_music_path_prefix = "res://addons/godot_scaffold/assets/music/",
    default_music_file_suffix = ".ogg",
    default_music_bus_index = 2,
    
    colors_manifest = _colors_manifest,
    styles_manifest = _styles_manifest,
    
    debug_params = _debug_params,
    player_action_classes = _player_action_classes,
    edge_movement_classes = _edge_movement_classes,
    player_param_classes = _player_param_classes,
    
    main_menu_music = "on_a_quest",
    game_over_music = "on_a_quest",
    godot_splash_sound = "achievement",
    developer_splash_sound = "single_cat_snore",
    level_end_sound = "cadence",
    
    third_party_license_text = \
            ScaffoldThirdPartyLicenses.TEXT + \
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
            "res://addons/godot_scaffold/assets/images/gui/snoring_cat_logo_about.png"),
    developer_splash = preload( \
            "res://addons/godot_scaffold/assets/images/gui/snoring_cat_logo_splash.png"),
    
    godot_splash_screen_duration_sec = 0.8 if !_debug else 0.0,
    developer_splash_screen_duration_sec = 1.0 if !_debug else 0.0,
    
    main_menu_image_scene_path = "res://src/gui/MainMenuImage.tscn",
    
    fade_in_transition_texture = \
            preload("res://addons/godot_scaffold/assets/images/transition_in.png"),
    fade_out_transition_texture = \
            preload("res://addons/godot_scaffold/assets/images/transition_out.png"),
    
    cell_size = Vector2(32.0, 32.0),
    
    # Should match Project Settings > Display > Window > Size > Width/Height
    default_game_area_size = Vector2(1024, 768),
    aspect_ratio_max = 2.0 / 1.0,
    aspect_ratio_min = 1.0 / 2.0,
    default_camera_zoom = 1.0,
    uses_level_scores = true,
}

var welcome_panel: WelcomePanel

func initialize(manifest: Dictionary) -> void:
    Gs.profiler.preregister_metric_keys(_metric_keys)
