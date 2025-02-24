extends Node

func _ready():
	var console = get_parent().get_node("CommandConsole")
	console.connect("command_received", _on_command_received)

func _on_command_received(callsign: String, action: String, value1: float, value2: int):
	var airplane = $RadarScreen/Airplanes.get_node_or_null(callsign)
	if airplane == null:
		$CommandConsole.append_log("Airplane %s not found." % callsign)
		return

	match action:
		"TL":  # Turn Left
			airplane.set_heading(value1)
		"AS":  # Adjust Speed
			airplane.set_speed(value2)
		"AL":  # Adjust Altitude
			airplane.set_altitude(value2)
		_:
			$CommandConsole.append_log("Unknown action: %s" % action)

	$CommandConsole.append_log("Command executed: %s %s %f %d" % [callsign, action, value1, value2])
