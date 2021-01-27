extends Area


func _ready():
	pass


func _on_Area_body_entered(body):
	if body.collision_layer == 2:
		print(body.name + "Entered")
		$AnimationPlayer.play("Pop")
		body.pop(Vector3.UP * 10)


func _on_Area_body_exited(body):
	if body.collision_layer == 2:
		print(body.name + "Exited")
		$AnimationPlayer.play("Pop")
		print(translation.y)
