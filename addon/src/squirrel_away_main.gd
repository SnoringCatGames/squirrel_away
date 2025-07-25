class_name SquirrelAwayMain
extends Node


# FIXME: LEFT OFF HERE: Implement manifests. ------------------------------
@export var snore_core_settings: SnoreCoreMainSettings
@export var scaffolder_settings: ScaffolderSettings
@export var surfacer_settings: SurfacerSettings

@export var run_tests := true


func _ready() -> void:
    Sq.snore_core = SnoreCore.get_module("SnoreCore")
    Sq.scaffolder = SnoreCore.get_module("Scaffolder")
    Sq.surfacer = SnoreCore.get_module("Surfacer")

    Sq.snore_core.connect("all_modules_set_up_finished", _on_snore_core_set_up_finished)
    SnoreCore.set_up([snore_core_settings, scaffolder_settings, surfacer_settings])

    if run_tests:
        var tests_passed = SnoreCore.run_tests()


func _on_snore_core_set_up_finished() -> void:
    Sq.snore_core_settings = Sq.snore_core.get_settings()
    Sq.scaffolder_settings = Sq.scaffolder.get_settings()
    Sq.surfacer_settings = Sq.surfacer.get_settings()

    # FIXME: Port Scaffolder logic and get this running.
    #S.set_up(Sq.scaffolder_settings)
