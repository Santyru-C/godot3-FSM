extends Node2D

func _ready():
	var character = $Character
	character.connect("spell_casted", self, "_test")
	
func _test():
	$platform.toggle_state()
