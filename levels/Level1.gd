extends Node2D
var next_level_scene_path = "res://levels/Level2.tscn"
var current_level_scene_path = "res://levels/Level1.tscn"

func _ready():
	$Exit.set_next_level_path(next_level_scene_path)

func _physics_process(delta):
	if $PlatformLeft.get_weight() > $PlatformRight.get_weight():
		$PlatformLeft.move_down()
		$PlatformRight.move_up()
		
	if $PlatformLeft.get_weight() < $PlatformRight.get_weight():
		$PlatformLeft.move_up()
		$PlatformRight.move_down()
		
	if Input.is_action_pressed("escape"):
		reset()
		
func reset():
	get_tree().change_scene(current_level_scene_path)		

func _process(delta):
	if $Button.is_on():
		$Exit.turn_on()


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		reset()
	
