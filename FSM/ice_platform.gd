extends "res://scenes/environment/platforms/platform.gd"

func enter_season(season):
	print("callerdf asdf")
	match season:
		"winter":
			$Sprite.texture = sprite_winter
			$CollisionShape2D.disabled = false
		
		_:
			$Sprite.texture = sprite_summer
			$CollisionShape2D.disabled = true
			
