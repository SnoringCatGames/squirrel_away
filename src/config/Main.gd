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
    SquirrelAway.initialize(app_manifest)

#func _on_app_ready() -> void:
#    ._on_app_ready()
