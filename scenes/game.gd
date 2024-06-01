extends Node2D

const max_fps = 60
# Called when the node enters the scene tree for the first time.
func _ready():
	Engine.max_fps = max_fps


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(max_fps):
	pass
