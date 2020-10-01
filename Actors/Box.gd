extends RigidBody2D

enum State { DEFAULT, LEVITATING, PUSH }

var current_state = State.DEFAULT
var default_gravity = gravity_scale 
var player = null
var push_strenght = 1

func _integrate_forces(state):
	match current_state: 
		State.LEVITATING:
			levitate()
		State.DEFAULT:
			default()
		State.PUSH:
			push()

func _physics_process(delta):
	if Input.is_action_just_released("Levitate"):
		$Area2D/Timer.stop()
		set_deferred("mode", MODE_CHARACTER)
		current_state = State.DEFAULT
	if Input.is_action_just_pressed("Levitate_Push") and can_push():
		$Area2D/Timer.stop()
		set_deferred("mode", MODE_CHARACTER)
		current_state = State.PUSH
		
		
func get_weight():
	return weight

func can_push():
	return current_state == State.LEVITATING and player != null

func push():
	var direction = position - player.position
	self.apply_impulse(Vector2(), direction * push_strenght)
	current_state = State.DEFAULT

func default():
	set_deferred("mode", MODE_CHARACTER)
	pass

func levitate():
	apply_central_impulse(Vector2(0,-4))
	
func _ready():
	glow_off()
	GlobalData.set_box_weight(self.weight)
	default_gravity = gravity_scale 

func glow_on():
	$Light2D.set_process(true)
	$Light2D.visible = true
	
func glow_off():
	$Light2D.visible = false
	$Light2D.set_process(false)
	
	
func _on_Area2D_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("Levitate") and player != null:
		$Area2D/Timer.start()
		current_state = State.LEVITATING

func _on_Timer_timeout():
	set_deferred("mode", MODE_KINEMATIC)

func _on_PushArea_body_entered(body):
	if body.is_in_group("player"):
		player = body
		glow_on()


func _on_PushArea_body_exited(body):
	if body.is_in_group("player"):
		player = null
		glow_off()


