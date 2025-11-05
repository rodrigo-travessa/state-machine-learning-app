extends CharacterBody2D
class_name enemy

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _process(_delta: float) -> void:	
	if velocity.x > 0:
		sprite_2d.flip_h = false
	else:
		sprite_2d.flip_h = true

func _physics_process(_delta: float) -> void:
	move_and_slide()

func play_animations(animation_name: String):
	if animation_name and animation_player:
		animation_player.play(animation_name)
