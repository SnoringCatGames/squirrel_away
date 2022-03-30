tool
class_name SquirrelAwaySchema
extends FrameworkSchema


const _METADATA_SCRIPT := SquirrelAwayMetadata

var _properties := {
}

var _additive_overrides := {
    ScaffolderSchema: {
        colors_manifest = \
            Utils.get_direct_color_properties(SquirrelAwayDefaultColors.new()),
    },
}

var _subtractive_overrides := {}


func _init().(
        _METADATA_SCRIPT,
        _properties,
        _additive_overrides,
        _subtractive_overrides) -> void:
    pass
