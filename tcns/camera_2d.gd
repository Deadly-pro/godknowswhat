extends Camera2D

@export var player_path: NodePath
@export var camera_smooth_speed: float = 5.0  # Adjust as needed
@export var deadzone_size: Vector2 = Vector2(150, 30)  # The area inside which the player can move without moving camera

var player: Node2D

func _ready():
	if player_path != null:
		player = get_node(player_path)

func _process(delta):
	if player:
		var camera_pos = global_position
		var player_pos = player.global_position

		# Check horizontal movement
		if abs(player_pos.x - camera_pos.x) > deadzone_size.x:
			camera_pos.x = lerp(camera_pos.x, player_pos.x, camera_smooth_speed * delta)

		# Check vertical movement
		if abs(player_pos.y - camera_pos.y) > deadzone_size.y:
			camera_pos.y = lerp(camera_pos.y, player_pos.y, camera_smooth_speed * delta)

		global_position = camera_pos
