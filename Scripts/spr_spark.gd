#script: spr_spark
extends AnimatedSprite

const MEDAL_RADIUS = 11

func _ready():
	to_random_pos()
	
	var tex_medal = get_parent()
	tex_medal.connect("shown", get_node("anim"), "play", ["shine"])
	pass 
	
func to_random_pos():
	var rand_angle = deg2rad(rand_range(0,360))
	var rand_radius = rand_range(0, MEDAL_RADIUS)
	var x = rand_radius * cos (rand_angle) + MEDAL_RADIUS
	var y = rand_radius * sin (rand_angle) + MEDAL_RADIUS
	position = Vector2(x,y)
	pass
