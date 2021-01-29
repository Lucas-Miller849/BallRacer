extends Area

onready var turret_base := $TurretBase
onready var turret_barrel := $TurretBase/Barrel
onready var projectile_launcher := $TurretBase/Barrel/Position3D
onready var target = null 

export var fire_rate:float = 2.0
export var rotation_speed:float = 10

var projectile_prefab = preload("res://Triggers/Projectile.tscn")

func _process(delta):
	if target != null:
		aim()

func _ready():
	$Timer.wait_time = fire_rate
	$Timer.autostart = false
	$Timer.one_shot = true

func aim():
	turret_base.look_at(target.translation, Vector3.UP)
	
func fire():
	var b = projectile_prefab.instance()
	add_child(b)
	b.translation = projectile_launcher.translation
	b.rotation = projectile_launcher.rotation 
	print(target)
	$Timer.start()
	


func _on_Turret_body_entered(body):
	$Timer.start()
	if body.collision_layer == 2:
		print(body.name + " Entered Turret Zone")
		target = body


func _on_Turret_body_exited(body):
	if body.collision_layer == 2:
		print(body.name + " Exited Turret Zone")
		target = null


func _on_Timer_timeout():
	if target != null:
		fire()
