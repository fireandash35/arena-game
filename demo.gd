extends Node2D

var enemy = preload("res://enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var new_enem = enemy.instantiate()
	new_enem.position = Vector2(
		randi_range(-5000,5000),
		randi_range(-5000,5000)
		
	)

	add_child(new_enem)
	
