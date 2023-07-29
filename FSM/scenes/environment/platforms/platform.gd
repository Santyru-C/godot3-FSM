extends StaticBody2D

export(Texture) var sprite_active
export(Texture) var sprite_disabled

onready var collision_shape = $CollisionShape2D
onready var sprite_texture = $Sprite.texture

func enable_platform():
	collision_shape.disabled = false
	$Sprite.texture = sprite_active
	
func disable_platform():
	collision_shape.disabled = true
	$Sprite.texture = sprite_disabled

func toggle_state():
	if collision_shape.disabled:
		enable_platform()
	else:
		disable_platform()
