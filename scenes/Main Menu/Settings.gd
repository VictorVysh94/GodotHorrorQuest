extends Control

onready var FullscreenToggle = $MenuContainer/Fullscreen

func _ready():
	FullscreenToggle.pressed = OS.window_fullscreen

func _on_Music_value_changed(value):
	GlobalMusic.volume_db = value
	GlobalMusic.user_value = value

func _on_Effects_value_changed(value):
	GlobalEffects.volume_db = value
	GlobalEffects.user_value = value

func _on_Back_pressed():
	SceneChanger.change_scene(GlobalData.ScenePath["MAIN_MENU"]["MAIN"])

func _on_Fullscreen_toggled(button_pressed):
	OS.window_fullscreen = button_pressed
