extends CharacterBody2D

const SPEED = 400

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * SPEED

	move_and_slide()

#func _input(event: InputEvent) -> void:
	#if event is InputEventMouseMotion:
		#get_viewport().set_input_as_handled()
#
#func _unhandled_input(event: InputEvent) -> void:
	#print(event.as_text())
