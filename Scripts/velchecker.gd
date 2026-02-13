extends Node

@onready var player: CharacterBody2D = $".."
@onready var player_sprite: Sprite2D = $"../PlayerSprite"


func _process(_delta: float) -> void:
	player_sprite.set_vel(Vector2(
		sign(player.velocity.x)*pow(abs(player.velocity.x)/1500, 0.3),
		sign(player.velocity.y)*pow(abs(player.velocity.y)/1500, 2.0),
	))
