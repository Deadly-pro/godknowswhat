extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -300.0
var count = 0
var is_dead=false
@onready var animated_sprite = $AnimatedSprite2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func die():
	if is_dead:
		return
	is_dead = true
	animated_sprite.play("death")
	get_node("CollisionShape2D").call_deferred("queue_free")
	set_physics_process(false)
func end():
	$"../Camera2D/VideoStreamPlayer".z_index=100
	$"../Camera2D/VideoStreamPlayer".z_as_relative=false
	$"../Camera2D/VideoStreamPlayer".play()
	
func _physics_process(delta: float) -> void:
	# Death on pressing 'e'op other movement/animations during death if needed
	
	# Horizontal movement
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		# Sprite flipping
		if direction > 0:
			animated_sprite.flip_h = false
		else:
			animated_sprite.flip_h = true
	else:
		velocity.x = 0
	
	# Animation control and y logic control
	if is_on_floor():
		animated_sprite.play("run" if direction else "playermove")
		count = 0
		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_VELOCITY
	else:
		animated_sprite.play("jump")
		velocity.y += gravity * delta # Apply gravity
		if count:
			pass
		elif Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_VELOCITY
			count = 1
	
	move_and_slide()
