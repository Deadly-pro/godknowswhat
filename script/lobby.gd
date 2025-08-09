extends Node2D
#
#const PORT = 9001
#@onready var player_scene = preload("res://tcns/player.tscn")
#var p
func _ready():
	pass
#
#func connected():
	#print("Connected to server")
#
#func _input(event):
	#if event is InputEventKey and event.pressed:
		#var my_player = get_node_or_null("player")
		#if my_player:
			#var keycode = DisplayServer.keyboard_get_keycode_from_physical(event.physical_keycode)
			#if keycode == KEY_SPACE:
				#print("Unique id:",multiplayer.get_unique_id())
				#my_player.rpc("update_jump")
			#elif keycode == KEY_A or keycode == KEY_D:
				#pass
#
#func _on_button_pressed() -> void:
	#var client = ENetMultiplayerPeer.new()
	#var err = client.create_client("localhost", PORT)
	#if err != OK:
		#push_error("Client connection failed: %s" % err)
		#return
	#multiplayer.multiplayer_peer = client
	## spawn local player
	#spawn(multiplayer.get_unique_id())
	#print("Unique id:",multiplayer.get_unique_id())
	#print("Joined New Host")
#
#func _on_button_2_pressed() -> void:
	#var server = ENetMultiplayerPeer.new()
	#multiplayer.peer_connected.connect(_on_client_connected)
	#multiplayer.peer_disconnected.connect(_on_client_disconnected)
	#multiplayer.connection_failed.connect(_on_client_failed)
	#var err = server.create_server(PORT)
	#if err != OK:
		#push_error("Server creation failed: %s" % err)
		#return
	#multiplayer.multiplayer_peer = server
	## spawn server's own player
	#spawn(multiplayer.get_unique_id())
	#print("Unique id:",multiplayer.get_unique_id())
#
	#print("Server started on port ", PORT)
#
#func spawn(peer_id: int):
	#p = player_scene.instantiate()
	## offset so new players don’t spawn on top of each other
	#p.position = Vector2(-740.0, 24.99573)
	#p.name = str(peer_id)
	#add_child(p)
	## each player node is owned by their peer
	#print("Unique id:",peer_id)
	#p.set_multiplayer_authority(peer_id)
	#set_multiplayer_authority(peer_id)
#
#func _on_client_connected(peer_id: int):
	#spawn(peer_id)
	#print("connected client id:", peer_id)
#
#func _on_client_disconnected(id: int) -> void:
	#var player_node = get_node_or_null(str(id))
	#if player_node:
		#player_node.queue_free()
	#print("Disconnected client id:", id)
#
#func _on_client_failed(id: int) -> void:
	#print("failed client id:", id)


func _on_timer_timeout() -> void:
	pass # Replace with function body.
