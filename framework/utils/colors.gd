class_name Colors

# Lightness values (from 0 to 100).
const LIGHTNESS_NORMAL := 64
const LIGHTNESS_LIGHT := 80
const LIGHTNESS_DARK := 40
const LIGHTNESS_XDARK := 20

const WHITE := Color8(255, 255, 255)
const BLACK := Color8(0, 0, 0)

# Hue: 182 (from 0 to 360)
const TEAL := Color8(71, 249, 255)
#const TEAL_L := Color8(, , )
const TEAL_D := Color8(0, 197, 204)
#const TEAL_XD := Color8(, , )

# Hue: 278 (from 0 to 360)
const PURPLE := Color8(188, 71, 255)
#const PURPLE_L := Color8(, , )
const PURPLE_D := Color8(129, 0, 204)
#const PURPLE_XD := Color8(, , )

# Hue: 64 (from 0 to 360)
const YELLOW := Color8(243, 255, 71)
#const YELLOW_L := Color8(, , )
const YELLOW_D := Color8(190, 204, 0)
#const YELLOW_XD := Color8(, , )

# Alpha values (from 0 to 1).
const ALPHA_SOLID := 1.0
const ALPHA_SLIGHTLY_FAINT := 0.7
const ALPHA_FAINT := 0.5
const ALPHA_XFAINT := 0.3
const ALPHA_XXFAINT := 0.1

static func opacify(base_color: Color, opacity: float) -> Color:
    base_color.a = opacity
    return base_color