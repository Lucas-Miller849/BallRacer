extends Area

func _ready():
	pass



func _on_Area_body_entered(body):
	print(body.name)
	if body.name == "1x1x1":
		print("lift")
	elif body.name == "1x1x2":
		print("lift")
	else:
		$AnimationPlayer.play("Open")


func _on_Area_body_exited(body):
	print(body.name)
	if body.name == "1x1x1":
		print("lift")
	elif body.name == "1x1x2":
		print("lift")
	else:
		$AnimationPlayer.play("Close")
