extends Control

# Define the custom signal with proper parameters
signal command_received(callsign: String, action: String, value1: float, value2: int)

func _ready():
	$InputField.connect("text_submitted", Callable(self, "_on_command_entered"))

func _on_command_entered(command: String):
	# Example: Parse a command like "332 TL 22 110"
	var parts = command.strip_edges().split(" ")
	if parts.size() < 4:
		append_log("Invalid command: %s" % command)
		return

	var callsign = parts[0]
	var action = parts[1]
	var value1 = parts[2].to_float()
	var value2 = parts[3].to_int()

	emit_signal("command_received", callsign, action, value1, value2)
	append_log("You: %s" % command)

func append_log(message: String):
	$TransmissionLog.append_text("%s\n" % message)
