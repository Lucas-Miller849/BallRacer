extends KinematicBody

export var rotation_speed:float = .01
export var jump_power:float = 12
export var movement_speed:float = 10

var jumping:bool = false

var gravity:float = -24
var velocity:Vector3 = Vector3.ZERO

func _process(delta):
	getInput()

func _physics_process(delta):
	var vy = velocity.y
	
	velocity.y = vy + gravity + delta
	
	velocity = move_and_slide(velocity, Vector3.UP)
	
	if jumping && is_on_floor():
		velocity.y = jump_power
	

func _ready():
	pass

func getInput():
	velocity = Vector3.ZERO
	var z = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	velocity += z * movement_speed * transform.basis.z
	var x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity += x * movement_speed * transform.basis.x 
	jumping = Input.is_action_just_pressed("ui_select")

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-lerp(0, rotation_speed, event.relative.x))
