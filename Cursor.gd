extends Node2D

func _ready():
	var arrow = get_node("Sprite").texture
	Input.set_custom_mouse_cursor(arrow)
	
