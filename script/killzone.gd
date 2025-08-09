extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	print("You died!")
	if body.has_method("die"):
		body.die()
	if not timer.is_stopped():
		timer.stop()
		
	await get_tree().create_timer(1).timeout
	
	if body.has_method("die") :
		body.end()
	timer.start(2)

func _on_timer_timeout():
	get_tree().reload_current_scene()
