extends KinematicBody2D

var direction : Vector2 = Vector2(0, 1)
var velocity : Vector2 = Vector2.ZERO
var last_direction : int

export(int) var max_speed = 500
export(float) var t_max_speed = 0.5
export(float) var t_stop = 0.5
export(int) var max_jump_height = 175
export(float) var t_max_height = 0.5

onready var h_acceleration : float = (max_speed / pow(t_max_speed, 2))
onready var h_friction : float = (max_speed/ t_stop)
onready var jump_velocity = (2 * max_jump_height) / t_max_height * -1
onready var jump_gravity = (2 * max_jump_height) / pow(t_max_height, 2)
var current_gravity : float = 0

func _ready():
	$AnimationTree.get("parameters/playback").start("idle")
	current_gravity = jump_gravity
	
func update_input():
	direction.x = (
		Input.get_action_strength("ui_right") 
		- Input.get_action_strength("ui_left")
	)

func update_sprite_flip():
	#var h_flip = $Sprite.get("flip_h")
	$Sprite.flip_h = false if last_direction > 0 else true
	
func accelerate(delta):

	# reduce speed for faster turning
		
	velocity.x += h_acceleration * direction.x * delta
	
	if abs(velocity.x) >= max_speed:
		velocity.x = max_speed * direction.x

func desaccelerate(delta):
	if velocity.x > 1:
		velocity.x -= h_friction * delta
	if velocity.x < -1:
		velocity.x += h_friction * delta
	if abs(velocity.x) < 0.1:
		velocity.x = 0
		
func jump():
	velocity.y = jump_velocity
	
func apply_gravity(delta):
	velocity.y += current_gravity * delta
	
func _physics_process(delta):
	update_input()
	if direction.x != 0:
		last_direction = direction.x
	
	update_sprite_flip()
	apply_gravity(delta)
	velocity = move_and_slide(velocity, Vector2.UP)
