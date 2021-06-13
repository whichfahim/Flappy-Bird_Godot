#script: camera.gd
extends Camera2D 


# Declare member variables here. Examples:
onready var bird = utils.get_main_node().get_node("bird")
onready var camera = utils.get_main_node().get_node("camera")

func _ready():
	set_process(true)
	pass # Replace with function body.

func _process(delta):
	
	#set_pos(Vector2(bird.get_position_in_parent().x, get_position_in_parent().y))
	camera.position = Vector2(bird.position.x, camera.position.y)
	pass
	
func get_total_pos():
	return position + offset
	pass
