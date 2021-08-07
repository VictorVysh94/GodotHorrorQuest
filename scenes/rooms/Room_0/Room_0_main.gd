extends "res://scenes/rooms/room_main_handler.gd"

onready var Screamer : TextureRect = $screamer
onready var Screamer_animation : AnimationPlayer = $screamer/AnimationPlayer
onready var Screamer_effect = "res://sounds/enviroment/tv_sound_screamer.wav"
onready var BookMoveButton = $MoveTo4
onready var CorridorButton = $MoveTo5
onready var CorridorBlock = $ExitToCorridor

func _ready():
	if "Pencil" in PlayerData.PlayerInventoty and PlayerData.PlayerSawScreamers["ROOM_0"]["used"]==false:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		Screamer.visible = true
		GlobalEffects.play_effect(Screamer_effect)
		Screamer_animation.play("effect")
		yield(Screamer_animation, "animation_finished")
		Screamer.visible = false
		PlayerData.PlayerSawScreamers["ROOM_0"]["used"]=true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if "Keycard0" in PlayerData.PlayerInventoty:
		BookMoveButton.visible = false
	if PlayerData.PlayerProgress["ROOM_0"]["ROOM_0_KEYCARD_UNLOCKED"] == true:
		CorridorButton.visible = true


func _on_ExitToCorridor_pressed():
	if PlayerData.PlayerNotificationsMessages["ROOM_0_PANEL"] == false:
		GlobalMessageBox.send_msg("Кажется дверь закрыта")
		PlayerData.PlayerNotificationsMessages["ROOM_0_PANEL"] = true
	if PlayerData.PlayerProgress["ROOM_0"]["ROOM_0_KEYCARD_UNLOCKED"] == false:
		GlobalEffects.play_effect("res://sounds/enviroment/door_is_locked.wav")

func _on_KeycardReader_drop_correct():
	PlayerData.PlayerProgress["ROOM_0"]["ROOM_0_KEYCARD_UNLOCKED"] = true
	CorridorButton.visible = true
	CorridorBlock.visible = false
