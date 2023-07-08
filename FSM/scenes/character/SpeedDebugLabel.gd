extends Label

export(NodePath) var character_path

onready var character = get_node(character_path)

func _physics_process(_delta):
	self.text = "Speed: %s" % round(character.velocity.x)
