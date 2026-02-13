extends State


@onready var nav_agent: NavigationAgent2D = $"../../NavAgent"
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../PlayerSprite"

var state_name : String = "Walk"
var char_ref : CharacterBody2D
var temp_pos : Array

func enter(character : CharacterBody2D):
	char_ref = character
	makepath()
	char_ref.path_finished.connect(walk_finished_trans)
	#animated_sprite_2d.play("walk")
	
	
func physics_update(_delta : float):
	var dir = char_ref.to_local(nav_agent.get_next_path_position()).normalized()
	char_ref.velocity = dir * char_ref.speed

func makepath() -> void:
	var pos : Vector2 = char_ref.target_pos.pick_random() + Vector2(randf_range(-10.0,10.0),randf_range(-10.0,10.0))
	nav_agent.target_position = pos

		
func walk_finished_trans():
	if char_ref.current_target:
		transitioned.emit(self, "AttackState")
	else:
		transitioned.emit(self, "IdleState")
		
	
func exit():
	char_ref.path_finished.disconnect(walk_finished_trans)
