class_name Main
extends SurfacerBootstrap

func _ready() -> void:
    run(SquirrelAway.app_manifest, self)

#func _amend_app_manifest() -> void:
#    ._amend_app_manifest()

#func _register_app_manifest() -> void:
#    ._register_app_manifest()

func _initialize_framework() -> void:
    ._initialize_framework()
    SquirrelAway.initialize()

#func _on_app_initialized() -> void:
#    ._on_app_initialized()

#func _on_splash_finished() -> void:
#    ._on_splash_finished()
