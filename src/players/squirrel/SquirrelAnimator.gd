class_name SquirrelAnimator
extends PlayerAnimator

func _play_animation(
        name: String,
        playback_rate: float = 1,
        blend := 0.1) -> bool:
    _show_sprite(name)
    return ._play_animation(name, playback_rate, blend)

func _show_sprite(animation_name: String) -> void:
    # Hide the other sprites.
    var sprites := [
        $Run,
        $ClimbUp,
        $ClimbDown,
        $Stand,
        $HoldWall,
        $JumpFall,
        $JumpRise,
    ]
    for sprite in sprites:
        sprite.visible = false
    
    # Show the current sprite.
    match animation_name:
        "Run":
            $Run.visible = true
        "ClimbUp":
            $ClimbUp.visible = true
        "ClimbDown":
            $ClimbDown.visible = true
        "Stand":
            $Stand.visible = true
        "HoldWall":
            $HoldWall.visible = true
        "JumpFall":
            $JumpFall.visible = true
        "JumpRise":
            $JumpRise.visible = true
        _:
            Gs.logger.error()
