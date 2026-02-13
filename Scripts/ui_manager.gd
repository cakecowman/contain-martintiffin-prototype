extends Control

@onready var text_display: Panel = $TextDisplay


func _ready() -> void: 
	GameManager.GameOver.connect(_game_over_ui_update)
	
func _game_over_ui_update() -> void:
	text_display.show()
