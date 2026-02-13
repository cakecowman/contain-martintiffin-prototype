extends CharacterBody2D

signal path_finished
signal new_target

@export var speed : int = 200
@export var nav_targets : Node2D
@onready var nav_agent: NavigationAgent2D = $NavAgent

@onready var movement_state_machine: StateMachine = $MovementStateMachine
@onready var animated_sprite_2d: AnimatedSprite2D = $PlayerSprite

var target_pos : Array
var current_target : StaticBody2D = null

func _ready() -> void:
	for node in nav_targets.get_children():
			target_pos.append(node.global_position)
	#makepath()

func _physics_process(_delta: float) -> void:
	move_and_slide() 
	flip_char()

func flip_char() -> void:
	if velocity.x < 0:
		animated_sprite_2d.flip_h = true
	if velocity.x > 0:
		animated_sprite_2d.flip_h = false

func resturn_dest() -> Vector2:
	return $NavAgent.target_position

func retarget():
	new_target.emit()

func return_state() -> String:
	return movement_state_machine.curr_state_name

func _on_nav_agent_navigation_finished() -> void:
	path_finished.emit()
