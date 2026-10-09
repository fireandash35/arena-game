extends CharacterBody2D


const SPEED = 400
var damage = 30
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	velocity = Vector2.ZERO


	
	if Input.is_action_pressed("w"):
		velocity.y = -SPEED
	if Input.is_action_pressed("s"):
		velocity.y = SPEED
	if Input.is_action_pressed("d"):
		velocity.x = SPEED
	if Input.is_action_pressed("a"):
		velocity.x = -SPEED
	move_and_slide()
	for body in $Area2D.get_overlapping_bodies():
		if body.has_method('damage'):
			body.damage(damage)
