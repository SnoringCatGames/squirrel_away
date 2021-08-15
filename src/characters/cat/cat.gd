tool
class_name Cat
extends SurfacerCharacter


# Dictionary<SurfacerCharacter, boolean>
var current_colliding_npcs := {}
var just_collided_with_new_npc := false


func _process_sounds() -> void:
    if just_triggered_jump:
        Sc.audio.play_sound("cat_jump")
    
    if surface_state.just_left_air:
        Sc.audio.play_sound("cat_land")
    
    if just_collided_with_new_npc:
        Sc.audio.play_sound("contact")


func _update_surface_state(preserves_just_changed_state := false) -> void:
    ._update_surface_state(preserves_just_changed_state)
    _check_for_squirrel_collision()


# TODO: Replace with a more accurate/standard collision/mask-layer setup.
func _check_for_squirrel_collision() -> void:
    var collider_half_width_height := movement_params.collider_half_width_height

    var cat_min_half_dimension: float
    var cat_max_half_dimension: float
    if collider_half_width_height.x > collider_half_width_height.y:
        cat_max_half_dimension = collider_half_width_height.x
        cat_min_half_dimension = collider_half_width_height.y
    else:
        cat_max_half_dimension = collider_half_width_height.y
        cat_min_half_dimension = collider_half_width_height.x
    
    # Calculate current npc collisions.
    var colliding_npcs := []
    for npc in Sc.utils.get_all_nodes_in_group(
            Sc.characters.GROUP_NAME_NPCS):
        collider_half_width_height = \
                npc.movement_params.collider_half_width_height
        
        var cp_min_half_dimension: float
        var cp_max_half_dimension: float
        if collider_half_width_height.x > collider_half_width_height.y:
            cp_max_half_dimension = collider_half_width_height.x
            cp_min_half_dimension = collider_half_width_height.y
        else:
            cp_max_half_dimension = collider_half_width_height.y
            cp_min_half_dimension = collider_half_width_height.x
        
        var distance_squared_collision_threshold: float
        if cat_max_half_dimension > cp_max_half_dimension:
            distance_squared_collision_threshold = \
                    cat_min_half_dimension * cat_min_half_dimension
        else:
            distance_squared_collision_threshold = \
                    cp_min_half_dimension * cp_min_half_dimension
        
        if position.distance_squared_to(npc.position) < \
                distance_squared_collision_threshold:
            colliding_npcs.push_back(npc)
    
    # Record whether there were any new collisions this frame.
    just_collided_with_new_npc = false
    for npc in colliding_npcs:
        if !current_colliding_npcs.has(npc):
            just_collided_with_new_npc = true
    
    # Update the current collision set.
    current_colliding_npcs.clear()
    for npc in colliding_npcs:
        current_colliding_npcs[npc] = true
