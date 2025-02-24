extends Node2D

@export var airport_id: String = "ABC"
@export var runway_length: int = 3000  # Length in meters

func _ready():
	$Label.text = airport_id
