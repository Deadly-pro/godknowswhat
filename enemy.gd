extends Node2D
@onready var ray_cast_right=$RayCastright
@onready var ray_cast_left=$RayCastrightleft
@onready var animated_sprite=$AnimatedSprite2D
const SPEED=60
var direction=-1
# Called when the node enters the scene tree for the first time.
func _process(delta):
	if ray_cast_right.is_colliding():
		direction=-1
		animated_sprite.flip_h=true
	if ray_cast_left.is_colliding():
		direction=1
		animated_sprite.flip_h=false
	position.x+=direction*SPEED*delta #moving 60 pixel per second
	 #we are updating the x axis every frame
	#delta is the amount of time since the last frame
	#if higher frame rate move little if lower move more 
	# movement x delta 
	
	
