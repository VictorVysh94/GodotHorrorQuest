extends "res://scenes/rooms/room_main_handler.gd"

# ==============================================================================#
onready var flashlight = $UVFlashlight
onready var flashlight_sound = $UVFlashlight/AudioStreamPlayer2D
onready var NoFlashlight_timer = $NoFlashligthTimer
onready var MoveButton = $MoveTo3
onready var TweenNode = $UVFlashlight/Tween
# ==============================================================================#

# ==============================================================================#
onready var StickedPaper = $StickedPaper
onready var KeyPaper1 = $key_paper
onready var KeyPaper2 = $paper_sticked_uv
onready var KeyButton = $CloseLetter
onready var PencilHandler = $PencilHandler
onready var PencilSprite = $pencil
onready var PencilTween = $Tween
# ==============================================================================#

# ==============================================================================#
onready var key_textures = [
	preload("res://sprites/room_0/objects/paper_sticked.png"),
	preload("res://sprites/room_0/objects/key_paper_0.png"),
	preload("res://sprites/room_0/objects/key_paper_1.png"),
	preload("res://sprites/room_0/objects/key_paper_2.png"),
	preload("res://sprites/room_0/objects/key_paper_3.png"),
	preload("res://sprites/room_0/objects/key_paper.png")
]
onready var prencil_sound = preload("res://sounds/items/pencil_short.wav")
onready var pencil_movement = [
Vector2(760+256, 365-40),
Vector2(1095+256, 675-40),
Vector2(1095+256, 375-40),
Vector2(940+256, 380-40),
Vector2(745+256, 685-40),
Vector2(930+256, 660-40)]
onready var current_step = 0
# ==============================================================================#

func _ready():
	if "UVFlashlight" in PlayerData.PlayerInventoty:
		flashlight.visible = true
		flashlight.position = get_global_mouse_position()
		flashlight_sound.position = flashlight.position
		flashlight.turn_on_flashlight()
		flashlight_sound.play()
	else:
		GlobalMessageBox.send_msg("Здесь слишком темно.")
		NoFlashlight_timer.start()

func _on_NoFlashligthTimer_timeout():
	MoveButton.emit_signal("pressed")

func _on_MoveTo3_pressed():
	if flashlight.visible == true:
		flashlight.turn_off_flashlight()
		flashlight_sound.play()

func _on_StickedPaper_pressed():
	KeyPaper1.visible = true
	KeyPaper2.visible = true
	KeyButton.visible = true
	PencilHandler.visible = true
	StickedPaper.visible = false
	MoveButton.visible = false

func _on_CloseLetter_pressed():
	KeyPaper1.visible = false
	KeyPaper2.visible = false
	KeyButton.visible = false
	PencilHandler.visible = false
	StickedPaper.visible = true
	MoveButton.visible = true

func _on_PencilHandler_drop_correct():
	get_tree().call_group("inventory","open_inventory")
	PencilSprite.visible = true
	KeyButton.visible = false
	PencilTween.interpolate_property(PencilSprite,"position",
	Vector2(PencilSprite.position), Vector2(pencil_movement[current_step]),
	1, Tween.TRANS_LINEAR, Tween.EASE_OUT,1)
	PencilTween.start()
	
func _on_Tween_tween_completed(_object, _key):
	GlobalEffects.play_effect_preloaded(prencil_sound)
	KeyPaper1.texture = key_textures[current_step]
	current_step = current_step + 1
	if current_step == len(pencil_movement):
		GlobalMessageBox.send_msg("Теперь линии видно без фонарика.")
		PencilSprite.visible = false
		PlayerData.PlayerInventoty.append("PaperKey0")
		GlobalData.GameItems["PaperKey0"]["picked"]=true
		yield(get_tree().create_timer(1.5),"timeout")
		KeyButton.emit_signal("pressed")
		StickedPaper.queue_free()
		get_tree().call_group("inventory","clear_and_set")
	elif current_step == 2:
		GlobalMessageBox.send_msg("Похоже на какую-то комбинацию...")
		PencilTween.interpolate_property(PencilSprite,"position",
		Vector2(PencilSprite.position), Vector2(pencil_movement[current_step]),
		1, Tween.TRANS_LINEAR, Tween.EASE_OUT,1)
		PencilTween.start()
	else:
		PencilTween.interpolate_property(PencilSprite,"position",
		Vector2(PencilSprite.position), Vector2(pencil_movement[current_step]),
		1, Tween.TRANS_LINEAR, Tween.EASE_OUT,1)
		PencilTween.start()
