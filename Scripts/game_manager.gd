extends Node

signal GameOver


var LifeCount : int
var LifeCounter : Label

func _ready() -> void:
	
	var Trackeditems : Array = get_tree().get_nodes_in_group("Breakables")
	
	#if get_tree().get_nodes_in_group("Debug_UI"):
		#LifeCounter = get_tree().get_nodes_in_group("Debug_UI")[0]
	#
	#if LifeCount:
		#LifeCount = Trackeditems.size()
		#LifeCounter.text = str(LifeCount)
	#
	#for item in Trackeditems:
		#item.AmDestroyed.connect(update_life)


func update_life() -> void:
	LifeCount -= 1
	LifeCounter.text = str(LifeCount)
	
	if LifeCount <= 0: 
		init_game_over()

func init_game_over() -> void:
	GameOver.emit()
