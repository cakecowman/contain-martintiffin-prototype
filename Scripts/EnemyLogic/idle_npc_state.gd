extends State

var state_name : String = "Idle"
@onready var timer: Timer = $"../../Timer"
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../PlayerSprite"


var char_ref : CharacterBody2D
var player_input : Vector2

func enter(character : CharacterBody2D):
	char_ref = character
	timer.wait_time = randf_range(2.0,6.0)
	timer.start()
	animated_sprite_2d.stop()
	
func physics_update(_delta : float):
	char_ref.velocity = lerp(char_ref.velocity,Vector2.ZERO,.5)
	 
func _on_timer_timeout() -> void:
	transitioned.emit(self, "WalkState")

func exit():
	timer.stop()
