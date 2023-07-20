extends State

export(NodePath) var moving_state_path
export(NodePath) var idle_state_path

onready var moving_state = get_node(moving_state_path)
onready var idle_state = get_node(idle_state_path)

func on_enter():
	animation_node.travel("jumping")
	
func state_process(delta):
	# add custom speeds for air movement
	if character.direction.x != 0:
		character.accelerate(delta)

	if character.is_on_floor():
		next_state = idle_state if character.direction.x == 0 else moving_state

