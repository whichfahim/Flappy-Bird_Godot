#script: stage_manager
extends CanvasLayer

const STAGE_GAME = "res://Stages/Game_stage.tscn"
const STAGE_MENU = "res://Stages/menu_stage.tscn"

var is_changing = false

signal stage_changed

func _ready():
	get_node("tex_black").hide()
	pass 

func change_stage(stage_path):
	if is_changing: return
	
	is_changing = true
	get_tree().get_root().set_disable_input(true)
	
	#fade to black
	get_node("tex_black").show()
	get_node("anim").play("fade_in")
	audio_player.find_node("sfx_swooshing").play()
	yield(get_node("anim"), "animation_finished")
	
	#change stage
	get_tree().change_scene(stage_path)
	emit_signal("stage_changed")
	
	#fade from black
	get_node("anim").play("fade_out")
	yield(get_node("anim"),"animation_finished")
	get_node("tex_black").hide()
	
	is_changing = false
	get_tree().get_root().set_disable_input(false)
	pass
