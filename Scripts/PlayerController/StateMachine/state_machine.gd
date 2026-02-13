extends Node

class_name StateMachine

@export var initial_state : State

var curr_state : State
var curr_state_name : String
var states : Dictionary = {}

@onready var char_ref: CharacterBody2D = $".."

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transitioned.connect(on_state_child_transitioned)
	
	if initial_state:
		await get_tree().create_timer(0.1).timeout
		initial_state.enter(char_ref)
		curr_state = initial_state
		curr_state_name = curr_state.state_name

func _process(delta : float):
	if curr_state: curr_state.update(delta)
	
func _physics_process(delta: float):
	if curr_state: curr_state.physics_update(delta)

func on_state_child_transitioned(state : State, new_state_name : String):
	if state != curr_state: return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state: return
	
	if curr_state: curr_state.exit()
	
	new_state.enter(char_ref)
	
	curr_state = new_state
	curr_state_name = curr_state.state_name
