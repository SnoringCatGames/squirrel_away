tool
class_name SquirrelAwayLevel
extends SurfacerLevel

const _WELCOME_PANEL_RESOURCE_PATH := "res://src/gui/WelcomePanel.tscn"

func start() -> void:
    .start()
    
    _show_welcome_panel()
    
    # FIXME: Move this player creation (and readiness recording) back into
    #        Level.
    # Add the player after removing the loading screen, since the camera
    # will track the player, which makes the loading screen look offset.
    add_player( \
            Surfacer.player_params[Surfacer.default_player_name] \
                    .movement_params.player_resource_path, \
            Vector2.ZERO, \
            true, \
            false)
    var starting_squirrel_positions := [
        Vector2(192.0, -192.0),
#        Vector2(-192.0, 192.0),
    ]
    for squirrel_position in starting_squirrel_positions:
        add_player( \
                Surfacer.player_params["squirrel"].movement_params \
                        .player_resource_path, \
                squirrel_position, \
                false, \
                false)
    
    Surfacer.annotators.on_level_ready()
    
    Gs.audio.play_music("on_a_quest")

func _destroy() -> void:
    _hide_welcome_panel()
    ._destroy()

func quit(immediately := true) -> void:
    .quit(immediately)

func _on_initial_input() -> void:
    # Close the welcome panel on any mouse or key click event.
    if is_instance_valid(SquirrelAway.welcome_panel):
        _hide_welcome_panel()

func _show_welcome_panel() -> void:
    assert(SquirrelAway.welcome_panel == null)
    SquirrelAway.welcome_panel = Gs.utils.add_scene( \
            Gs.canvas_layers.layers.hud, \
            _WELCOME_PANEL_RESOURCE_PATH)

func _hide_welcome_panel() -> void:
    if SquirrelAway.welcome_panel != null:
        SquirrelAway.welcome_panel.queue_free()
        SquirrelAway.welcome_panel = null
