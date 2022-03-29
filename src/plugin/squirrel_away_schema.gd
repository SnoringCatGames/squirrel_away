tool
class_name SquirrelAwaySchema
extends FrameworkSchema


const _METADATA_SCRIPT := SquirrelAwayMetadata

var _properties := {
}

var _overrides := {
    ScaffolderSchema: {
        colors_manifest = \
            Utils.get_direct_color_properties(SquirrelAwayDefaultColors.new()),
    },
}


func _init().(_METADATA_SCRIPT, _properties, _overrides) -> void:
    pass
