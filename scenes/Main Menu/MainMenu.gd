extends Control

func _ready():
	Input.set_custom_mouse_cursor(load("res://sprites/mouse_cursor/usable.png"), Input.CURSOR_HELP)
	pass

func _on_MoveTo_pressed():
	# Нужно обновить все переменные когда мы начинаем новую игру.
	GlobalMusic.play_music_preload(preload("res://sounds/background/game_background.mp3"))
	pass
