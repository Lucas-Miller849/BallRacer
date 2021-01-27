extends Area

onready var spawn_point = get_node("SpawnPoint1")


func _on_KillFloor_body_entered(body):
	if body.collision_layer == 2:
		print(body.name)
		body.translation = spawn_point.translation
