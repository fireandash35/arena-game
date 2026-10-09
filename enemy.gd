extends CharacterBody2D

@onready var agent = $NavigationAgent2D
var speed = 300
var health = 90
var body : CharacterBody2D
var can_damage = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	body = get_tree().get_first_node_in_group('player')
	target(body.global_position)
	if agent.is_navigation_finished():
		velocity = Vector2.ZERO
		return
	
	target(body.global_position)
	var new:Vector2 = agent.get_next_path_position()
	
	var direction : Vector2 = global_position.direction_to(new)
	
	velocity = direction * speed
	move_and_slide()

func target(tar:Vector2):
	agent.target_position = tar
func damage(dam):
	if can_damage:
		health -= dam
		$Timer.start()
		can_damage = false
	if health <= 0:
		queue_free()


func _on_timer_timeout() -> void:
	can_damage = true
	
