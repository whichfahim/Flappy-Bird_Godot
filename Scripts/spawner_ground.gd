#spawner_ground.tscn
extends Node2D

const scn_ground = preload("res://Scenes/ground.tscn")
const GROUND_WIDTH = 168
const AMOUNT_TO_FILL_VIEW = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(AMOUNT_TO_FILL_VIEW):
		spawn_and_move()
#		spawn_ground()
#		go_next_pos()
	pass # Replace with function body.

func spawn_and_move():
	spawn_ground()
	go_next_pos()
	pass

func spawn_ground():
	var new_ground = scn_ground.instance()
	new_ground.position = position
	new_ground.connect("tree_exited", self, "spawn_and_move")
#	new_ground.connect("tree_exited", self, "spawn_ground")
#	new_ground.connect("tree_exited", self, "go_next_pos")
	get_node("container").add_child(new_ground)
	pass

func go_next_pos():
	position = ( position + Vector2( GROUND_WIDTH, 0))
	#set_pos( get_pos() + Vector2(GROUND_WIDTH, 0))
	pass
