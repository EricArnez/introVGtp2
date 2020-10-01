extends Area2D

var next_level_path = ""
var was_turned_on= false

func set_next_level_path(path):
	next_level_path = path


func glow_on():
	$Light2D.set_process(true)
	$Light2D.visible = true
		
func glow_off():
	$Light2D.visible = false
	$Light2D.set_process(false)
	

func turn_on():
	glow_on()
	was_turned_on = true

func _ready():
	glow_off()

func _on_Exit_body_entered(body):
	if(was_turned_on) and body.is_in_group("player"):
		get_tree().change_scene(next_level_path)
