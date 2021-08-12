tool
class_name SquirrelAwayLevel
extends SurfacerLevel


var _does_level_have_squirrels := false

# Array<PositionAlongSurface>
var squirrel_destinations := []

var cat: Cat

# NOTE: This is a hack so that we don't see errors about SquirrelAway not being
#       declared when we aren't in the squirrel_away project.
onready var SquirrelAway: Node = get_node("/root/SquirrelAway")


#func _load() -> void:
#    ._load()


func _start() -> void:
    ._start()
    
    cat = human_player

    _does_level_have_squirrels = \
            Sc.level_config.get_level_config(Sc.level_session.id) \
            .platform_graph_player_names.has("squirrel")
    
    if _does_level_have_squirrels and \
            !SquirrelAway.omit_squirrels:
        _parse_squirrel_destinations()
        var starting_squirrel_positions := [
            Vector2(192.0, -192.0),
    #        Vector2(-192.0, 192.0),
        ]
        for squirrel_position in starting_squirrel_positions:
            add_player(
                    "squirrel",
                    squirrel_position,
                    false)


func _destroy() -> void:
    squirrel_destinations.clear()
    ._destroy()


#func _on_initial_input() -> void:
#    ._on_initial_input()


#func quit(immediately := true) -> void:
#    .quit(immediately)


#func _on_intro_choreography_finished() -> void:
#    ._on_intro_choreography_finished()


#func pause() -> void:
#    .pause()


#func on_unpause() -> void:
#    .on_unpause()


func get_music_name() -> String:
    return "on_a_quest"


func get_slow_motion_music_name() -> String:
    # FIXME: Add slo-mo music
    return ""


# FIXME: Decouple this squirrel-specific logic from the rest of the framework.
func _parse_squirrel_destinations() -> void:
    squirrel_destinations.clear()
    var configured_destinations := Sc.utils.get_all_nodes_in_group(
            SquirrelAway.group_name_squirrel_destinations)
    if !configured_destinations.empty():
        assert(configured_destinations.size() == 1)
        var crash_test_dummy: CrashTestDummy = \
                Su.graph_parser.crash_test_dummies["squirrel"]
        for configured_point in configured_destinations[0].get_children():
            assert(configured_point is Position2D)
            var destination := \
                    SurfaceParser.find_closest_position_on_a_surface(
                            configured_point.position,
                            crash_test_dummy)
            squirrel_destinations.push_back(destination)
    else:
        for i in 6:
            squirrel_destinations.push_back(
                    _create_random_squirrel_spawn_position())


func _create_random_squirrel_spawn_position() -> PositionAlongSurface:
    var bounds := Su.graph_parser.surface_parser.combined_tile_map_rect.grow(
            -Squirrel.SQUIRREL_SPAWN_LEVEL_OUTER_MARGIN)
    var x := randf() * bounds.size.x + bounds.position.x
    var y := randf() * bounds.size.y + bounds.position.y
    var point := Vector2(x, y)
    return SurfaceParser.find_closest_position_on_a_surface(
            point,
            Su.graph_parser.crash_test_dummies["squirrel"])
