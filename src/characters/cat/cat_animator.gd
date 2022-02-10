tool
class_name CatAnimator
extends SurfacerCharacterAnimator


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
        standard_name: String,
        blend := 0.1) -> bool:
    if ._play_animation(standard_name, blend):
        # In case we transition out mid-blink.
        unblink()
        
        # Most animations need the torso to be in front of the hip.
        move_torse_up()
        
        return true
    else:
        return false


func animation_name_to_playback_rate(standard_name: String) -> float:
    match standard_name:
        "ClimbUp":
            return 9.4
        "ClimbDown":
            return -4.03
        _:
            return animations[standard_name].speed


func _standand_animation_name_to_specific_animation_name(
        standard_name: String) -> String:
    match standard_name:
        "ClimbUp":
            return "Climb"
        "ClimbDown":
            return "Climb"
        "JumpRise":
            return "JumpRise"
        "JumpFall":
            return "JumpFall"
        "Rest", \
        "Stand":
            return "Rest"
        "RestOnWall":
            return "RestOnWall"
        "RestOnCeiling":
            return "RestOnCeiling"
        "Walk":
            return "Walk"
        "CrawlOnCeiling":
            return "CrawlOnCeiling"
        _:
            Sc.logger.error("CatAnimator._standand_animation_name_to_specific_animation_name")
            return ""
