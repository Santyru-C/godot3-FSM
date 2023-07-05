extends KinematicBody2D

func _ready():
	$AnimationTree.get("parameters/playback").start("idle")
	
