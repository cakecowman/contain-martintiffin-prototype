extends State


@onready var nav_agent: NavigationAgent2D = $"../../NavAgent"
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../PlayerSprite"
@onready var swing_timer: Timer = $"../../SwingTimer"


var state_name : String = "Attack"
var char_ref : CharacterBody2D


func enter(character : CharacterBody2D):
	char_ref = character
	char_ref.new_target.connect(target_update_trans)
	swing_timer.timeout.connect(_on_swing_timer_timeout)
	swing_timer.wait_time = 2.0
	swing_timer.start()
	
func physics_update(_delta : float):
	char_ref.velocity = lerp(char_ref.velocity,Vector2.ZERO,.5)

func target_update_trans():
	swing_timer.timeout.disconnect(_on_swing_timer_timeout)
	transitioned.emit(self, "IdleState")


func exit():
	char_ref.new_target.disconnect(target_update_trans)
	swing_timer.stop()
	


func _on_swing_timer_timeout() -> void:
	pass
	if char_ref.current_target:
		char_ref.current_target.attack(1)
	#print("ATTACK: ", char_ref.current_target.name)
