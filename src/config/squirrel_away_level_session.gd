class_name SquirrelAwayLevelSession
extends SurfacerLevelSession
# NOTE: Don't store references to nodes that should be destroyed with the
#       level, because this session-state will persist after the level is
#       destroyed.


var duckling_scare_count := 0


func reset(id: String) -> void:
    .reset(id)
    duckling_scare_count = 0
