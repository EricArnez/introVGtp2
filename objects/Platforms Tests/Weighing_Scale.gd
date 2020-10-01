extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if ($Platform_left.carried_weight > $Platform_right.carried_weight):
		$Platform_left.move_down(1)	
		$Platform_right.move_up(1)
	if ($Platform_left.carried_weight < $Platform_right.carried_weight):
		$Platform_right.move_down(1)		
		$Platform_left.move_up(1)
	else:
		pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
