tool
class_name SquirrelAwayLevel
extends SurfacerLevel

const _WELCOME_PANEL_RESOURCE_PATH := "res://src/gui/WelcomePanel.tscn"

var _does_level_have_squirrels := false

# Array<PositionAlongSurface>
var squirrel_destinations := []

func _enter_tree() -> void:
    _does_level_have_squirrels = \
            Gs.level_config.get_level_config(_id).player_names.has("squirrel")

#func _load() -> void:
#    ._load()

func _start() -> void:
    ._start()
    
    _show_welcome_panel()
    
    if _does_level_have_squirrels:
        _parse_squirrel_destinations()
        var starting_squirrel_positions := [
            Vector2(192.0, -192.0),
    #        Vector2(-192.0, 192.0),
        ]
        for squirrel_position in starting_squirrel_positions:
            add_player(
                    Surfacer.player_params["squirrel"].movement_params \
                            .player_resource_path,
                    squirrel_position,
                    false)

func _destroy() -> void:
    _hide_welcome_panel()
    squirrel_destinations.clear()
    ._destroy()

#func quit(immediately := true) -> void:
#    .quit(immediately)

func _on_initial_input() -> void:
    # Close the welcome panel on any mouse or key click event.
    if is_instance_valid(SquirrelAway.welcome_panel):
        _hide_welcome_panel()

func _get_music_name() -> String:
    return "on_a_quest"

func _show_welcome_panel() -> void:
    assert(SquirrelAway.welcome_panel == null)
    SquirrelAway.welcome_panel = Gs.utils.add_scene(
            Gs.canvas_layers.layers.hud,
            _WELCOME_PANEL_RESOURCE_PATH)

func _hide_welcome_panel() -> void:
    if SquirrelAway.welcome_panel != null:
        SquirrelAway.welcome_panel.queue_free()
        SquirrelAway.welcome_panel = null

# FIXME: Decouple this squirrel-specific logic from the rest of the framework.
func _parse_squirrel_destinations() -> void:
    squirrel_destinations.clear()
    var configured_destinations := Gs.utils.get_all_nodes_in_group(
            SquirrelAway.group_name_squirrel_destinations)
    if !configured_destinations.empty():
        assert(configured_destinations.size() == 1)
        var squirrel_player: SquirrelPlayer = \
                _get_platform_graph_for_player("squirrel") \
                .collision_params.player
        for configured_point in configured_destinations[0].get_children():
            assert(configured_point is Position2D)
            var destination := \
                    SurfaceParser.find_closest_position_on_a_surface(
                            configured_point.position,
                            squirrel_player)
            squirrel_destinations.push_back(destination)
    else:
        for i in 6:
            squirrel_destinations.push_back(
                    _create_random_squirrel_spawn_position())

func _create_random_squirrel_spawn_position() -> PositionAlongSurface:
    var bounds := graph_parser.surface_parser.combined_tile_map_rect.grow(
            -SquirrelPlayer.SQUIRREL_SPAWN_LEVEL_OUTER_MARGIN)
    var x := randf() * bounds.size.x + bounds.position.x
    var y := randf() * bounds.size.y + bounds.position.y
    var point := Vector2(x, y)
    return SurfaceParser.find_closest_position_on_a_surface(
            point,
            graph_parser.fake_players["squirrel"])
