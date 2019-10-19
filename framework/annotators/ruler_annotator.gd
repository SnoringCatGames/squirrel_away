extends Node2D
class_name RulerAnnotator

const GRID_SPACING := 64.0

const LINE_WIDTH := 1.0

var LINE_COLOR := Colors.opacify(Colors.WHITE, Colors.ALPHA_XXFAINT)
var TEXT_COLOR := Colors.opacify(Colors.WHITE, Colors.ALPHA_XFAINT)

var global: Global
var viewport: Viewport

var viewport_size: Vector2
var screen_center := Vector2.ZERO

func _init(global: Global) -> void:
    self.global = global

func _enter_tree() -> void:
    viewport = get_viewport()
    viewport_size = viewport.get_visible_rect().size
    get_tree().get_root().connect("size_changed", self, "_on_viewport_size_changed")

func _process(delta: float) -> void:
    var next_screen_center := global.current_camera.get_camera_screen_center()
    
    if next_screen_center != screen_center:
        # The camera position moved, so we need to update the ruler.
        screen_center = next_screen_center
        update()

func _draw() -> void:
    var screen_start_position := screen_center - viewport_size / 2.0
    
    # Offset the start position to align with the grid cell boundaries.
    var ruler_start_position := Vector2( \
            -fmod((screen_start_position.x + GRID_SPACING * 1000000000), GRID_SPACING), \
            -fmod((screen_start_position.y + GRID_SPACING * 1000000000), GRID_SPACING))
    
    var ruler_size := viewport_size + Vector2(GRID_SPACING, GRID_SPACING)
    var vertical_line_count := floor(ruler_size.x / GRID_SPACING) as int + 1
    var horizontal_line_count := floor(ruler_size.y / GRID_SPACING) as int + 1
    
    var label := Label.new()
    var font := label.get_font("")
    
    var start_x: float
    var start_y: float
    var start_position: Vector2
    var end_position: Vector2
    var text: String
    
    # Draw the vertical lines.
    start_y = ruler_start_position.y
    for i in range(vertical_line_count):
        start_x = ruler_start_position.x + GRID_SPACING * i
        start_position = Vector2(start_x, start_y)
        end_position = Vector2(start_x, start_y + ruler_size.y)
        draw_line(start_position, end_position, LINE_COLOR, LINE_WIDTH)
        
        text = str(floor(screen_start_position.x + start_x))
        draw_string(font, Vector2(start_position.x + 2, 14), text, TEXT_COLOR)
    
    # Draw the horizontal lines.
    start_x = ruler_start_position.x
    for i in range(1, horizontal_line_count):
        start_y = ruler_start_position.y + GRID_SPACING * i
        start_position = Vector2(start_x, start_y)
        end_position = Vector2(start_x + ruler_size.x, start_y)
        draw_line(start_position, end_position, LINE_COLOR, LINE_WIDTH)
        
        text = str(floor(screen_start_position.y + start_y))
        draw_string(font, Vector2(2, start_position.y + 14), text, TEXT_COLOR)
    
    label.free()

func _on_viewport_size_changed() -> void:
    viewport_size = viewport.get_visible_rect().size
    update()