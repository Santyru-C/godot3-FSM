extends Label

export(NodePath) var state_machine_path
onready var state_machine = get_node(state_machine_path)

func _process(_delta):
	self.text = "%s" % state_machine.current_state.name
