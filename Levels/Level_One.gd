extends Spatial


func _ready():
	pass

func _process(delta):
	$AnimationPlayer.play("Move")
