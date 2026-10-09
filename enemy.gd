extends CharacterBody2D

@onready var agent = $NavigationAgent2D
var speed = 200
# Called when the node enters the scene tree for the first time.

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if agent.is_navigation_finished():
		velocity = Vector2.ZERO
	
	
	if agent.distance_to_target():
		velocity = agent.target_desired_distance
	

	
	move_and_slide()
