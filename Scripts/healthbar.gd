extends TextureProgressBar

@export var altar: StaticBody2D

func _ready() -> void:
	update()

func update():
	value = altar.health_var * 100 / altar.max_health
