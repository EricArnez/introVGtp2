extends StaticBody2D

var is_on = false


func turn_on_sprite():
	$Button.visible = false
	$Pushed_Button.visible = true
	
func turn_off_sprite():
	$Pushed_Button.visible = false
	$Button.visible = true
	

func _ready():
	turn_off_sprite()


func is_on():
	return is_on

func _on_Switch_On_Area_body_entered(body):
	if body.is_in_group("with weight"):
		turn_on_sprite()
		is_on = true
