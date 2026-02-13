extends StaticBody2D

signal AmDestroyed

@export var nav_points: Array[Node2D]

@onready var healthbar: TextureProgressBar = $CanvasLayer/TextureProgressBar

const max_health : int = 10
var health_var : int = 10

var current_enemies : Array[CharacterBody2D]

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("EnemyType"):
		body.current_target = self
		current_enemies.append(body)

func attack(damage: int):
	
	health_var -= damage
	#print("ATTACKED: ", damage, " " , health_var)
	healthbar.update()
	
	if health_var <= 0:
		kill_self()

func kill_self():
	for enemy in current_enemies:
		enemy.retarget()
		
	for points in nav_points:
		points.queue_free()
	
	AmDestroyed.emit()
	queue_free()
