extends Node2D
var next_level_scene_path = "res://levels/Level3.tscn"
var current_level_scene_path = "res://levels/Level2.tscn"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Exit.set_next_level_path(next_level_scene_path)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if $Button.is_on():
		$Exit.turn_on()
	if Input.is_action_pressed("escape"):
		reset()
		
func reset():
	get_tree().change_scene(current_level_scene_path)	
