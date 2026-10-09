extends CharacterBody2D

var body : Node2D
var speed = 200
# Called when the node enters the scene tree for the first time.

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	body = get_tree().get_first_node_in_group('player')
	var direction = get_global_position().direction_to(body.global_position)
	if not is_instance_valid(body): 
		return
	
	
	position = speed * direction * delta
	
	
	move_and_slide()
