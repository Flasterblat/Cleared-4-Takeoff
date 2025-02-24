extends Node2D

# Variables for airplane properties
@export var callsign: String = "H332"
@export var type: String = "H"  # "H" = Heavy, "M" = Medium, "L" = Light
@export var altitude: int = 15000
@export var target_altitude: int = 25000
@export var speed: int = 350
@export var heading: float = 90.0  # Degrees

func _ready():
	update_arrow()
	update_labels()

func update_arrow():
	var line_width = 6 if type == "H" else 4 if type == "M" else 2
	$Arrow.width = line_width
	$Arrow.default_color = Color.WHITE if type == "H" else Color.YELLOW if type == "M" else Color.GREEN

func update_labels():
	$LabelContainer/CallsignLabel.text = callsign
	$LabelContainer/InfoLabel.text = "%d ↑ %d @ %d" % [altitude, target_altitude, speed]

func set_altitude(new_altitude: int):
	altitude = new_altitude
	update_labels()

func set_speed(new_speed: int):
	speed = new_speed
	update_labels()

func set_heading(new_heading: float):
	heading = new_heading
	rotation_degrees = heading - 90  # Rotate arrow to match heading
