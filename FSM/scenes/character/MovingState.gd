extends State

export(NodePath) var idle_state_path
export(NodePath) var air_state_path

onready var idle_state = get_node(idle_state_path)
onready var air_state = get_node(air_state_path)

func on_enter():
	animation_node.travel("running")
	
func state_process(delta):
	if character.direction.x == 0:
		next_state = idle_state
	
	else:
		character.accelerate(delta)
	
# set gravity on player, evaluate which other variable should be alocated outside this state
func state_input(event : InputEvent):
	if event.is_action_pressed("ui_accept"):
		character.jump()
		next_state = air_state
