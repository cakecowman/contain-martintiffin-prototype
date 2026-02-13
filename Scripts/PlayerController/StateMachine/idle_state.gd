extends State

class_name IdleState

var state_name : String = "Idle"

var char_ref : CharacterBody2D
var player_input : Vector2

func enter(character : CharacterBody2D):
	char_ref = character
	
	char_ref.move_speed = char_ref.walk_speed
	char_ref.move_accel = char_ref.walk_accel
	char_ref.move_deccel = char_ref.walk_deccel

	char_ref.player_sprite.play("idle")
	
func physics_update(_delta : float):
	player_input = char_ref.get_input()
	
	if player_input:
		transitioned.emit(self, "WalkState")
	else:
		char_ref.velocity = player_input * 0.0
