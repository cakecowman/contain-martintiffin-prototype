extends CharacterBody2D

signal health_depleted

var input: Vector2
var move_speed : float
var move_accel: float
var move_deccel : float
var is_dodging : bool
var can_shoot : bool = true
var last_player_input : Vector2 = Vector2.RIGHT
var health : float

@onready var player_sprite: AnimatedSprite2D = $PlayerSprite


@export_group("Keybindings")
@export var move_up_action : String = ""
@export var move_down_action : String = ""
@export var move_left_action : String = ""
@export var move_right_action : String = ""
@export var attack_action : String = ""

@export_group("Movement Variables")
@export var walk_speed : float = 150
@export var walk_accel : float = 5.0
@export var walk_deccel : float = 10.0

func _ready():
	move_speed = walk_speed
	move_accel = walk_accel
	move_deccel = walk_deccel

func _physics_process(_delta):
	move_and_slide()
	flip_char()


func get_input():
	input.x = Input.get_action_strength(move_right_action) - Input.get_action_strength(move_left_action)
	input.y = Input.get_action_strength(move_down_action) - Input.get_action_strength(move_up_action)
	if input:
		last_player_input = input
	return input.normalized()

	
func flip_char() -> void:
	if velocity.x < 0:
		player_sprite.flip_h = true
	if velocity.x > 0:
		player_sprite.flip_h = false
