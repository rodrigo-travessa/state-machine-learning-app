extends State
class_name EnemyIdle

@export var Parent: CharacterBody2D
@export var move_speed: float = 10.0
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

var move_direction: Vector2
var wander_time: float
var player : CharacterBody2D

func randomize_wander():
	move_direction = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized()
	wander_time = randf_range(1,4)

func Enter():
	animation_player.play("run")
	player = get_tree().get_first_node_in_group("player")
	randomize_wander()

func Update(delta:float):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()

func Update_Physics(delta: float):
	var direction = player.global_position - Parent.global_position
	if direction.length() < 200:
		TransitionTo.emit(self, "follow")
		return
	if Parent:
		Parent.velocity = move_direction * move_speed
