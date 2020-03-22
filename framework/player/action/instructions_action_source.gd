extends PlayerActionSource
class_name InstructionsActionSource

const InstructionsPlayback := preload("res://framework/player/action/instructions_playback.gd")

# Array<InstructionsPlayback>
var _all_playback := []

func _init( \
        player, \
        is_additive: bool) \
        .( \
        "CP", \
        player, \
        is_additive) -> void:
    pass

# Calculates actions for the current frame.
func update( \
        actions: PlayerActionState, \
        previous_actions: PlayerActionState, \
        time_sec: float, \
        delta: float, \
        navigation_state: PlayerNavigationState) -> void:
    var is_pressed: bool
    var non_pressed_keys := []
    
    for playback in _all_playback:
        # Handle any new key presses up till the current time.
        var new_instructions: Array = playback.update(time_sec, navigation_state)
        
        non_pressed_keys.clear()
        
        # Handle all previously started keys that are still pressed.
        for input_key in playback.active_key_presses:
            is_pressed = playback.active_key_presses[input_key]
            update_for_key_press( \
                    actions, \
                    previous_actions, \
                    input_key, \
                    is_pressed, \
                    time_sec)
            if !is_pressed:
                non_pressed_keys.push_back(input_key)
        
        # Remove from the active set all keys that are no longer pressed.
        for input_key in non_pressed_keys:
            playback.active_key_presses.erase(input_key)
    
    # Handle instructions that finish.
    var i := 0
    while i < _all_playback.size():
        if _all_playback[i].is_finished:
            _all_playback.remove(i)
            i -= 1
        i += 1

func start_instructions( \
        edge: Edge, \
        time_sec: float) -> InstructionsPlayback:
    var playback := InstructionsPlayback.new(edge, is_additive)
    playback.start(time_sec)
    _all_playback.push_back(playback)
    return playback

func cancel_playback( \
        playback: InstructionsPlayback, \
        time_sec: float) -> bool:
    # Log the release of any pressed keys.
    for active_key_press in playback.active_key_presses:
        if playback.active_key_presses[active_key_press]:
            print("STOP  %5s:%8s;%8.3fs;%29sp;%29sv" % [ \
                    PlayerActionSource.input_key_to_action_name(active_key_press), \
                    player.player_name, \
                    time_sec, \
                    player.position, \
                    player.velocity \
                    ])
    
    # Remove the playback.
    var index := _all_playback.find(playback)
    if index < 0:
        return false
    else:
        _all_playback.remove(index)
        return true

func cancel_all_playback() -> void:
    _all_playback.clear()
