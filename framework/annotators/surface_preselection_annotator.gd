extends Node2D
class_name SurfacePreselectionAnnotator

var PRESELECTION_SURFACE_COLOR: Color = \
        Colors.opacify(Colors.PURPLE, Colors.ALPHA_XFAINT)
var PRESELECTION_POSITION_INDICATOR_COLOR: Color = \
        Colors.opacify(Colors.PURPLE, Colors.ALPHA_XFAINT)
const PRESELECTION_MIN_OPACITY := 0.5
const PRESELECTION_MAX_OPACITY := 1.0
const PRESELECTION_DURATION_SEC := 0.6
const PRESELECTION_SURFACE_DEPTH := DrawUtils.SURFACE_DEPTH * 4.0
const PRESELECTION_SURFACE_OUTWARD_OFFSET := 64.0
const PRESELECTION_SURFACE_LENGTH_PADDING := 64.0
const PRESELECTION_POSITION_INDICATOR_LENGTH := 128.0
const PRESELECTION_POSITION_INDICATOR_RADIUS := 32.0

var global # TODO: Add type back
var player: Player
var preselection_position_to_draw: PositionAlongSurface = null
var animation_start_time := -PRESELECTION_DURATION_SEC
var animation_progress := 1.0
var phantom_surface := Surface.new(
        [Vector2.INF], \
        SurfaceSide.FLOOR, \
        null, \
        [])
var phantom_position_along_surface := PositionAlongSurface.new()

func _init(player: Player) -> void:
    self.player = player

func _ready() -> void:
    self.global = $"/root/Global"

func _process(delta: float) -> void:
    var current_time: float = global.elapsed_play_time_sec
    
    var did_preselection_position_change = \
            preselection_position_to_draw != player.preselection_position
    
    if did_preselection_position_change and \
            player.new_selection_target == Vector2.INF:
        var previous_preselection_surface := \
                preselection_position_to_draw.surface if \
                preselection_position_to_draw != null else \
                null
        var next_preselection_surface := \
                player.preselection_position.surface if \
                player.preselection_position != null else \
                null
        var did_preselection_surface_change := \
                previous_preselection_surface != next_preselection_surface
        
        preselection_position_to_draw = player.preselection_position
        
        if did_preselection_surface_change:
            animation_start_time = current_time
            
            if next_preselection_surface != null:
                _update_phantom_surface()
        
        if preselection_position_to_draw != null:
            _update_phantom_position_along_surface()
        
        update()
    
    if preselection_position_to_draw != null:
        animation_progress = \
                fmod((current_time - animation_start_time) / PRESELECTION_DURATION_SEC, 1.0)
        update()

func _draw() -> void:
    if preselection_position_to_draw == null:
        # When we don't render anything in this draw call, it clears the draw buffer.
        return
    
    var alpha_multiplier := ((1 - animation_progress) * \
            (PRESELECTION_MAX_OPACITY - PRESELECTION_MIN_OPACITY) + PRESELECTION_MIN_OPACITY)
    
    var surface_alpha := PRESELECTION_SURFACE_COLOR.a * alpha_multiplier
    var surface_color := Color( \
            PRESELECTION_SURFACE_COLOR.r, \
            PRESELECTION_SURFACE_COLOR.g, \
            PRESELECTION_SURFACE_COLOR.b, \
            surface_alpha)
    DrawUtils.draw_surface( \
            self, \
            phantom_surface, \
            surface_color, \
            PRESELECTION_SURFACE_DEPTH)
    
    var position_indicator_alpha := PRESELECTION_POSITION_INDICATOR_COLOR.a * alpha_multiplier
    var position_indicator_color := Color( \
            PRESELECTION_POSITION_INDICATOR_COLOR.r, \
            PRESELECTION_POSITION_INDICATOR_COLOR.g, \
            PRESELECTION_POSITION_INDICATOR_COLOR.b, \
            position_indicator_alpha)
    var cone_end_point := phantom_position_along_surface.target_projection_onto_surface
    var circle_center := cone_end_point + phantom_surface.normal * \
            (PRESELECTION_POSITION_INDICATOR_LENGTH - PRESELECTION_POSITION_INDICATOR_RADIUS)
    DrawUtils.draw_ice_cream_cone( \
            self, \
            cone_end_point, \
            circle_center, \
            PRESELECTION_POSITION_INDICATOR_RADIUS, \
            position_indicator_color, \
            true, \
            INF, \
            4.0)

func _update_phantom_surface() -> void:
    # Copy the vertices from the target surface.
    
    phantom_surface.vertices = preselection_position_to_draw.surface.vertices
    phantom_surface.side = preselection_position_to_draw.surface.side
    phantom_surface.normal = preselection_position_to_draw.surface.normal
    
    # Enlarge and offset the phantom surface, so that it stands out more.
    
    var surface_center := preselection_position_to_draw.surface.center
    
    var length := \
            preselection_position_to_draw.surface.bounding_box.size.x if \
            preselection_position_to_draw.surface.normal.x == 0.0 else \
            preselection_position_to_draw.surface.bounding_box.size.y
    var scale_factor := (length + PRESELECTION_SURFACE_LENGTH_PADDING * 2.0) / length
    var scale := Vector2(scale_factor, scale_factor)
    
    var translation := \
            preselection_position_to_draw.surface.normal * PRESELECTION_SURFACE_OUTWARD_OFFSET
    
    var transform := Transform2D()
    transform = transform.translated(-surface_center)
    transform = transform.scaled(scale)
    transform = transform.translated(translation / scale_factor)
    transform = transform.translated(surface_center / scale_factor)
    
    for i in range(phantom_surface.vertices.size()):
        phantom_surface.vertices[i] = transform.xform(phantom_surface.vertices[i])
    
    phantom_surface.bounding_box = Geometry.get_bounding_box_for_points(phantom_surface.vertices)

func _update_phantom_position_along_surface() -> void:
    phantom_position_along_surface.match_surface_target_and_collider( \
            phantom_surface, \
            preselection_position_to_draw.target_point, \
            Vector2.ZERO, \
            true, \
            true)