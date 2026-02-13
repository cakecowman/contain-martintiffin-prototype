extends Sprite2D
 
var tw:Tween
 
@export var freq:float
@export_range(0.0, 1.0) var amp:float
@export_range(0.0, 1.0) var tilt:float
@export var bloop:float
 
var vel:Vector2
var t:float = 0
var bounce:float = 0


func set_vel(v:Vector2):
	vel = v
 
func _process(delta):
	rotation = vel.x*PI*tilt+sin(t*freq)*PI*amp*abs(vel.x)
	t += delta

	#scale.x = 1.0-abs(vel.y)
 
