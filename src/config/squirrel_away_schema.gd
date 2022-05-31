tool
class_name SquirrelAwaySchema
extends FrameworkSchema


const _METADATA_SCRIPT := SquirrelAwayMetadata

var _metadata := {
    pauses_on_focus_out = true,
    also_prints_to_stdout = true,
    logs_character_events = true,
    logs_analytics_events = true,
    logs_bootstrap_events = true,
    logs_device_settings = true,
    logs_in_editor_events = true,
    is_profiler_enabled = true,
    are_all_levels_unlocked = true,
    are_test_levels_included = true,
    is_save_state_cleared_for_debugging = false,
    opens_directly_to_level_id = "",
    is_splash_skipped = false,
    uses_threads = false,
    thread_count = 1,
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
    app_version = "0.8.0",
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

var _sounds_manifest := [
    {
        name = "cat_jump",
        volume_db = 0.0,
        path_prefix = "",
    },
    {
        name = "cat_land",
        volume_db = 0.0,
        path_prefix = "",
    },
    {
        name = "cat_hit_surface",
        volume_db = 0.0,
        path_prefix = "",
    },
    {
        name = "contact",
        volume_db = 0.0,
        path_prefix = "",
    },
    {
        name = "squirrel_jump",
        volume_db = 0.0,
        path_prefix = "",
    },
    {
        name = "squirrel_land",
        volume_db = 0.0,
        path_prefix = "",
    },
    {
        name = "squirrel_yell",
        volume_db = 0.0,
        path_prefix = "",
    },
]

var _music_manifest := [
    {
        name = "on_a_quest",
        path_prefix = "res://addons/scaffolder/assets/music/",
        volume_db = 0.0,
        bpm = 75.0,
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
    default_player_character_name = "cat",
    character_scenes = _character_scenes,
    character_categories = _character_categories,
    omits_npcs = false,
    can_include_player_characters = true,
}

var _level_manifest := {
    level_config_class = SquirrelAwayLevelConfig,
    level_session_class = SquirrelAwayLevelSession,
    default_camera_bounds_level_margin = \
        ScaffolderLevelConfig.DEFAULT_CAMERA_BOUNDS_LEVEL_MARGIN,
    default_character_bounds_level_margin = \
        ScaffolderLevelConfig.DEFAULT_CHARACTER_BOUNDS_LEVEL_MARGIN,
}

var _gui_manifest := {
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
    pause_item_manifest = [
        LevelControlRow,
        TimeControlRow,
#        FastestTimeControlRow,
#        LongestTimeControlRow,
#        ScoreControlRow,
#        HighScoreControlRow,
    ],
    game_over_item_manifest = [
        LevelControlRow,
        TimeControlRow,
#        FastestTimeControlRow,
#        LongestTimeControlRow,
#        ScoreControlRow,
#        HighScoreControlRow,
    ],
    level_select_item_manifest = [
        TotalPlaysControlRow,
#        FastestTimeControlRow,
#        LongestTimeControlRow,
        HighScoreControlRow,
    ],
    hud_manifest = {
        hud_key_value_box_size = Vector2(256.0, 48.0),
        hud_key_value_list_item_manifest = [
            {
                item_class = TimeControlRow,
                settings_enablement_label = "Time",
                enabled_by_default = true,
                settings_group_key = "hud",
            },
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
}

var _properties := {
}

var _additive_overrides := {
    ScaffolderSchema: {
        metadata = _metadata,
        audio_manifest = _audio_manifest,
        character_manifest = _character_manifest,
        level_manifest = _level_manifest,
        colors_manifest = \
            Utils.get_direct_color_properties(SquirrelAwayDefaultColors.new()),
        annotation_parameters_manifest = Sc.utils.merge(
            Utils.get_direct_non_color_properties(
                SquirrelAwayDefaultAnnotationParameters.new()),
            Utils.get_direct_non_color_properties(
                SquirrelAwayDefaultColors.new())),
        gui_manifest = _gui_manifest,
    },
    SurfacerSchema: {
        movement_manifest = {
            do_player_actions_interrupt_navigation = true,
        },
        cancel_active_player_control_on_invalid_nav_selection = false,
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
                        # FIXME: ------------------- Make this 3.0 after fixing support for it in SurfaceParser.
                        subtile_collision_margin = 0.0,
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
    ScaffolderSchema: {
        character_manifest = {
            character_scenes = [
                preload("res://addons/squirrel_away/src/characters/squirrel/squirrel.tscn"),
            ],
            character_categories = [
                ScaffolderSchema._SQUIRREL_CATEGORY,
            ]
        }
    },
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
