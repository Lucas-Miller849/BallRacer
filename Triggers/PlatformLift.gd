extends Area

onready var lift := $lift

func _ready():
	pass


func _on_PlatformLift_body_entered(body):
	print(body.name + "Entered")
	if body.name == "lift":
		print("liftUp")
	else:
		$AnimationPlayer.play("Up")


func _on_PlatformLift_body_exited(body):
	print(body.name + "Exited")
	if body.name == "lift":
		print("lift")
	else:
		$AnimationPlayer.play("Down")
