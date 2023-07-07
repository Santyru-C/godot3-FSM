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

func update_sprite_flip():
	#var h_flip = $Sprite.get("flip_h")
	$Sprite.flip_h = false if last_direction > 0 else true
	print(direction.x)
	
func accelerate(delta, h_acceleration, max_speed):
	if last_direction != direction.x:
		velocity.x /= 4 # reduce speed for faster turning
		
	velocity.x += h_acceleration * direction.x * delta
	
	if abs(velocity.x) >= max_speed:
		velocity.x = max_speed * direction.x

func _physics_process(delta):
	update_input()
	if direction.x != 0:
		last_direction = direction.x
	update_sprite_flip()
	velocity = move_and_slide(velocity, Vector2.UP)
