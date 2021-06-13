#Script: pipe
extends StaticBody2D

onready var right = get_node("right")
onready var camera = utils.get_main_node().get_node("camera")
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	add_to_group(game.GROUP_PIPES)
	#add_to_group("pipes")
	pass
	
func _process(delta):
	if camera == null: return
	
	if right.global_position.x <= camera.get_total_pos().x:
		queue_free()
	pass
