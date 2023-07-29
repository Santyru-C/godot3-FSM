extends State

export(NodePath) var idle_state_path

onready var idle_state = get_node(idle_state_path)

func on_enter():
	animation_node.travel("casting")
	character.emit_signal("spell_casted")

func state_process(delta):
	character.desaccelerate(delta)
	
func on_exit():
	next_state = idle_state
