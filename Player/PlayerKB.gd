extends KinematicBody

export var speed:float = 10
var velocity:Vector3

func _process(delta):
	getInput()

func _physics_process(delta):
	var norm = velocity.normalized() * speed
	rotate_x(norm.z)
	rotate_z(norm.x)
	
	print(norm)
	move_and_slide(norm)
	

func _ready():
	pass

func getInput():
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.z = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
