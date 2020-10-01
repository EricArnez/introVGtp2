extends KinematicBody2D

const UP = Vector2(0, -1)

const GRAVITY = 20
const MAX_SPEED = 100
const ACCELERATION = 50
export var jump_height = -150
var weight = 0.0

var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	set_motion_from_input()
	motion = move_and_slide(motion, UP,false,4,PI/4,false)
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("box"): 
			collision.collider.apply_central_impulse(-collision.normal * weight)

func	get_weight():
	return weight 

func set_motion_from_input():
	var friction = false
	var new_motion = motion 
	if Input.is_action_pressed("Right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
	elif Input.is_action_pressed("Left"):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
	else:
		friction = true
		motion.x = lerp(motion.x, 0, 0.2)
	if is_on_floor():
		if Input.is_action_just_pressed("Jump"):
			motion.y = jump_height
		if friction:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if friction:
			motion.x = lerp(motion.x, 0, 0.05)

func _ready():
	weight = GlobalData.get_box_weight() * 2
	#jump_height = -get_node("Sprite").texture.get_height()
