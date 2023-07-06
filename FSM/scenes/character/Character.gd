extends KinematicBody2D

var direction : Vector2 = Vector2(0, 1)
var velocity : Vector2 = Vector2.ZERO
var last_direction : int

func _ready():
	$AnimationTree.get("parameters/playback").start("idle")
	
func update_input():
	direction.x = (
		Input.get_action_strength("ui_right") 
		- Input.get_action_strength("ui_left")
	)

func _physics_process(delta):
	update_input()
	print(direction.x)
