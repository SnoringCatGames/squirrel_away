# A collection of utility functions for calculating state related to movement.
class_name MovementUtils

# Calculates the duration to reach the destination with the given movement parameters.
#
# - Since we are dealing with a parabolic equation, there are likely two possible results.
#   returns_lower_result indicates whether to return the lower, non-negative result.
# - expects_only_one_positive_result indicates whether to report an error if there are two
#   positive results.
# - Returns INF if we cannot reach the destination with our movement parameters.
static func calculate_movement_duration( \
        displacement: float, \
        v_0: float, \
        a: float, \
        returns_lower_result := true, \
        min_duration := 0.0, \
        expects_only_one_positive_result := false, \
        allows_no_positive_results := false) -> float:
    # FIXME: B: Account for max y velocity when calculating any parabolic motion.
    
    # Use only non-negative results.
    assert(min_duration >= 0)
    
    if displacement == 0 and returns_lower_result and min_duration == 0.0:
        # The start position is the destination.
        return 0.0
    elif a == 0:
        # Handle the degenerate case with no acceleration.
        if v_0 == 0:
            # We can't reach the destination, since we're not moving anywhere.
            return INF 
        elif (displacement > 0) != (v_0 > 0):
            # We can't reach the destination, since we're moving in the wrong direction.
            return INF
        else:
            # s = s_0 + v_0*t
            return displacement / v_0
    
    # From a basic equation of motion:
    #     s = s_0 + v_0*t + 1/2*a*t^2.
    # Solve for t using the quadratic formula.
    var discriminant := v_0 * v_0 + 2 * a * displacement
    if discriminant < 0:
        # We can't reach the end position from our start position.
        return INF
    var discriminant_sqrt := sqrt(discriminant)
    var t1 := (-v_0 + discriminant_sqrt) / a
    var t2 := (-v_0 - discriminant_sqrt) / a
    
    # Optionally ensure that only one result is positive.
    assert(!expects_only_one_positive_result or t1 < 0 or t2 < 0)
    
    # Check for two negative results.
    if t1 < 0 and t2 < 0:
        assert(allows_no_positive_results)
        return INF
    
    min_duration += Geometry.FLOAT_EPSILON
    
    if t1 < min_duration:
        if t2 < min_duration:
            return INF
        else:
            return t2
    elif t2 < min_duration:
        if t1 < min_duration:
            return INF
        else:
            return t1
    else:
        if returns_lower_result:
            return min(t1, t2)
        else:
            return max(t1, t2)

# Calculates the duration to accelerate over in order to reach the destination at the given time,
# given that velocity continues after acceleration stops and a new backward acceleration is
# applied.
# 
# Note: This could depend on a speed that exceeds the max-allowed speed.
# FIXME: F: Remove if no-one is still using this.
static func calculate_time_to_release_acceleration( \
        time_start: float, \
        time_step_end: float, \
        position_start: float, \
        position_end: float, \
        velocity_start: float, \
        acceleration_start: float, \
        post_release_backward_acceleration: float, \
        returns_lower_result := true, \
        expects_only_one_positive_result := false) -> float:
    var duration := time_step_end - time_start
    
    # Derivation:
    # - Start with basic equations of motion
    # - v_1 = v_0 + a_0*t_0
    # - s_2 = s_1 + v_1*t_1 + 1/2*a_1*t_1^2
    # - s_0 = s_0 + v_0*t_0 + 1/2*a_0*t_0^2
    # - t_2 = t_0 + t_1
    # - Do some algebra...
    # - 0 = (1/2*(a_0 - a_1)) * t_0^2 + (t_2 * (a_1 - a_0)) * t_0 + (s_2 - s_0 - t_2 * (v_0 + 1/2*a_1*t_2))
    # - Apply quadratic formula to solve for t_0.
    var a := 0.5 * (acceleration_start - post_release_backward_acceleration)
    var b := duration * (post_release_backward_acceleration - acceleration_start)
    var c := position_end - position_start - duration * \
            (velocity_start + 0.5 * post_release_backward_acceleration * duration)
    
    # This would produce a divide-by-zero.
    assert(a != 0)
    
    var discriminant := b * b - 4 * a * c
    if discriminant < 0:
        # We can't reach the end position from our start position.
        return INF
    var discriminant_sqrt := sqrt(discriminant)
    var t1 := (-b + discriminant_sqrt) / 2.0 / a
    var t2 := (-b - discriminant_sqrt) / 2.0 / a
    
    # Optionally ensure that only one result is positive.
    assert(!expects_only_one_positive_result or t1 < 0 or t2 < 0)
    # Ensure that there are not two negative results.
    assert(t1 >= 0 or t2 >= 0)
    
    # Use only non-negative results.
    if t1 < 0:
        return t2
    elif t2 < 0:
        return t1
    else:
        if returns_lower_result:
            return min(t1, t2)
        else:
            return max(t1, t2)

# Calculates the minimum required time to reach the displacement, considering a maximum velocity.
static func calculate_time_for_displacement( \
        displacement: float, \
        velocity_start: float, \
        acceleration: float, \
        max_speed: float) -> float:
    if displacement == 0.0:
        # The start position is the destination.
        return 0.0
    elif acceleration == 0.0:
        # Handle the degenerate case with no acceleration.
        if velocity_start == 0.0:
            # We can't reach the destination, since we're not moving anywhere.
            return INF 
        elif (displacement > 0.0) != (velocity_start > 0.0):
            # We can't reach the destination, since we're moving in the wrong direction.
            return INF
        else:
            # s = s_0 + v_0*t
            return displacement / velocity_start
    
    var velocity_at_max_speed := max_speed if displacement > 0.0 else -max_speed
    
    # From a basic equation of motion:
    #     v = v_0 + a*t
    # Algebra...
    #     t = (v - v_0) / a
    var time_to_reach_max_speed := \
            (velocity_at_max_speed - velocity_start) / acceleration
    if time_to_reach_max_speed < 0.0:
        # We're accelerating in the wrong direction.
        return INF
    
    # From a basic equation of motion:
    #     s = s_0 + v_0*t + 1/2*a*t^2
    # Algebra...
    #     (s - s_0) = v_0*t + 1/2*a*t^2
    var displacement_to_reach_max_speed := \
            velocity_start * time_to_reach_max_speed + \
            0.5 * acceleration * time_to_reach_max_speed * \
            time_to_reach_max_speed
    
    if displacement_to_reach_max_speed > displacement and displacement > 0.0 or \
            displacement_to_reach_max_speed < displacement and displacement < 0.0:
        # We do not reach max speed before we reach the displacement.
        return calculate_movement_duration( \
                displacement, \
                velocity_start, \
                acceleration, \
                true, \
                0.0, \
                true)
    else:
        # We reach max speed before we reach the displacement.
        
        var remaining_displacement_at_max_speed := displacement - displacement_to_reach_max_speed
        # From a basic equation of motion:
        #     s = s_0 + v*t
        # Algebra...
        #     t = (s - s_0) / v
        var remaining_time_at_max_speed := \
                remaining_displacement_at_max_speed / velocity_at_max_speed
        
        return time_to_reach_max_speed + remaining_time_at_max_speed

static func calculate_velocity_end_for_displacement( \
        displacement: float, \
        velocity_start: float, \
        acceleration: float, \
        max_speed: float) -> float:
    if displacement == 0.0:
        # The start position is the destination.
        return velocity_start
    elif acceleration == 0.0:
        # Handle the degenerate case with no acceleration.
        if velocity_start == 0.0:
            # We can't reach the destination, since we're not moving anywhere.
            return INF 
        elif (displacement > 0.0) != (velocity_start > 0.0):
            # We can't reach the destination, since we're moving in the wrong direction.
            return INF
        else:
            # s = s_0 + v_0*t
            return displacement / velocity_start
    
    var velocity_at_max_speed := max_speed if displacement > 0.0 else -max_speed
    
    # From a basic equation of motion:
    #     v = v_0 + a*t
    # Algebra...
    #     t = (v - v_0) / a
    var time_to_reach_max_speed := \
            (velocity_at_max_speed - velocity_start) / acceleration
    if time_to_reach_max_speed < 0.0:
        # We're accelerating in the wrong direction.
        return INF
    
    # From a basic equation of motion:
    #     s = s_0 + v_0*t + 1/2*a*t^2
    # Algebra...
    #     (s - s_0) = v_0*t + 1/2*a*t^2
    var displacement_to_reach_max_speed := \
            velocity_start * time_to_reach_max_speed + \
            0.5 * acceleration * time_to_reach_max_speed * \
            time_to_reach_max_speed
    
    if displacement_to_reach_max_speed > displacement and displacement > 0.0 or \
            displacement_to_reach_max_speed < displacement and displacement < 0.0:
        # We do not reach max speed before we reach the displacement.
        
        var time_for_displacement := calculate_movement_duration( \
                displacement, \
                velocity_start, \
                acceleration, \
                true, \
                0.0, \
                true)
        
        # From a basic equation of motion:
        #     v = v_0 + a*t
        return velocity_start + acceleration * time_for_displacement
    else:
        # We reach max speed before we reach the displacement.
        return velocity_at_max_speed

static func create_position_offset_from_target_point( \
        target_point: Vector2, \
        surface: Surface, \
        collider_half_width_height: Vector2, \
        clips_to_surface_bounds := false) -> PositionAlongSurface:
    var position := PositionAlongSurface.new()
    position.match_surface_target_and_collider( \
            surface, \
            target_point, \
            collider_half_width_height, \
            true, \
            clips_to_surface_bounds)
    return position

static func create_position_from_target_point( \
        target_point: Vector2, \
        surface: Surface, \
        collider_half_width_height: Vector2, \
        offsets_target_by_half_width_height := false, \
        clips_to_surface_bounds := false) -> PositionAlongSurface:
    assert(surface != null)
    var position := PositionAlongSurface.new()
    position.match_surface_target_and_collider( \
            surface, \
            target_point, \
            collider_half_width_height, \
            offsets_target_by_half_width_height, \
            clips_to_surface_bounds)
    return position

static func create_position_without_surface(target_point: Vector2) -> PositionAlongSurface:
    var position := PositionAlongSurface.new()
    position.target_point = target_point
    return position

static func update_velocity_in_air( \
        velocity: Vector2, \
        delta: float, \
        is_pressing_jump: bool, \
        is_first_jump: bool, \
        horizontal_acceleration_sign: int, \
        movement_params: MovementParams) -> Vector2:
    var is_ascending_from_jump := velocity.y < 0 and is_pressing_jump
    
    # Make gravity stronger when falling. This creates a more satisfying jump.
    # Similarly, make gravity stronger for double jumps.
    var gravity_multiplier := 1.0 if !is_ascending_from_jump else \
            (movement_params.slow_ascent_gravity_multiplier if is_first_jump \
                    else movement_params.ascent_double_jump_gravity_multiplier)
    
    # Vertical movement.
    velocity.y += delta * movement_params.gravity_fast_fall * gravity_multiplier
    
    # Horizontal movement.
    velocity.x += delta * movement_params.in_air_horizontal_acceleration * horizontal_acceleration_sign
    
    return velocity

static func cap_velocity( \
        velocity: Vector2, \
        movement_params: MovementParams, \
        current_max_horizontal_speed: float) -> Vector2:
    # Cap horizontal speed at a max value.
    velocity.x = clamp(velocity.x, -current_max_horizontal_speed, current_max_horizontal_speed)
    
    # Kill horizontal speed below a min value.
    if velocity.x > -movement_params.min_horizontal_speed and \
            velocity.x < movement_params.min_horizontal_speed:
        velocity.x = 0
    
    # Cap vertical speed at a max value.
    velocity.y = clamp(velocity.y, -movement_params.max_vertical_speed, \
            movement_params.max_vertical_speed)
    
    # Kill vertical speed below a min value.
    if velocity.y > -movement_params.min_vertical_speed and \
            velocity.y < movement_params.min_vertical_speed:
        velocity.y = 0
    
    return velocity

static func calculate_time_to_climb( \
        distance: float, \
        is_climbing_upward: bool, \
        movement_params: MovementParams) -> float:
    var speed := movement_params.climb_up_speed if is_climbing_upward else \
            movement_params.climb_down_speed
    # From a basic equation of motion:
    #     s = s_0 + v*t
    # Algebra...
    #     t = (s - s_0) / v
    return distance / speed

static func calculate_time_to_walk( \
        distance: float, \
        v_0: float, \
        movement_params: MovementParams) -> float:
    return calculate_time_for_displacement( \
            distance, \
            v_0, \
            movement_params.walk_acceleration, \
            movement_params.max_horizontal_speed_default)