class_name CatAnimator
extends PlayerAnimator

const HEAD_UNBLINK_REGION := Rect2(26, 39, 22, 18)
const HEAD_BLINK_REGION := Rect2(47, 91, 22, 18)


func move_torse_up() -> void:
    $Hip/Torso/TorsoSprite.z_index = 0


func move_torse_down() -> void:
    $Hip/Torso/TorsoSprite.z_index = -1


func blink() -> void:
    $Hip/Torso/Neck/Head.region_rect = HEAD_BLINK_REGION


func unblink() -> void:
    $Hip/Torso/Neck/Head.region_rect = HEAD_UNBLINK_REGION


func _play_animation(
        animation_type: int,
        blend := 0.1) -> bool:
    if ._play_animation(animation_type, blend):
        # In case we transition out mid-blink.
        unblink()
        
        # Most animations need the torso to be in front of the hip.
        move_torse_up()
        
        return true
    else:
        return false
