extends "res://scenes/environment/platforms/platform.gd"

func enter_season(season):
	print("called")
	match season:
		"summer":
			$Sprite.texture = sprite_summer
		"autumn":
			$Sprite.texture = sprite_autumn
		"winter":
			$Sprite.texture = null
			toggle_collision()
		"spring":
			$Sprite.texture = sprite_spring
			toggle_collision()
