extends "res://scenes/rooms/room_main_handler.gd"

onready var BookAnim = $BookAnimation
onready var BookSound = preload("res://sounds/items/book_open_sound.wav")
onready var PickupSound = preload("res://sounds/items/key_pickup.wav")
onready var BookSprite_closed = preload("res://sprites/room_0/objects/book_closed.png")
onready var BookSprite_keypad = preload("res://sprites/room_0/objects/book_keypad.png")
onready var BookSprite_haskey = preload("res://sprites/room_0/objects/book_opened_has_key0.png")
onready var BookSprite_nokey = preload("res://sprites/room_0/objects/book_opened.png")


onready var player = $Effects
onready var keypad = $keypad
onready var password_sprite = $PasswordSprite
onready var goback = $GoBack

onready var ok_sound = preload("res://sounds/keypad/keypad_ok.wav")
onready var wrong_sound = preload("res://sounds/keypad/keypad_wrong.wav")
onready var done_sound = preload("res://sounds/keypad/keypad_done.wav")

onready var keypad_normal = preload("res://sprites/room_0/objects/keypad.png")
onready var keypad_done = preload("res://sprites/room_0/objects/keypad_done.png")
onready var keypad_wrong = preload("res://sprites/room_0/objects/keypad_wrong.png")

onready var user_input : String = ""
onready var password : String = "193278"

func _ready():
	book_open_anim()

func book_open_anim():
	BookAnim.texture = BookSprite_closed
	yield(get_tree().create_timer(1.5),"timeout")
	player.stream = BookSound
	player.play()
	BookAnim.texture = BookSprite_keypad
	yield(get_tree().create_timer(3),"timeout")
	BookAnim.visible = false
	keypad.visible = true
	if "PaperKey0" in PlayerData.PlayerInventoty:
		password_sprite.visible = true
	goback.visible = true

func book_close_anim():
	BookAnim.visible = true
	goback.visible = false
	keypad.visible = false
	BookAnim.texture = BookSprite_haskey
	yield(get_tree().create_timer(3),"timeout")
	player.stream = PickupSound
	player.play()
	BookAnim.texture = BookSprite_nokey
	yield(get_tree().create_timer(3),"timeout")
	BookAnim.visible = false
	goback.emit_signal("pressed")


func _on_pressed_key(KeyNumber):
	user_input = user_input+KeyNumber
	if len(user_input) >= len(password):
		if password == user_input:
			keypad.texture = keypad_done
			player.stream = done_sound
			user_input = ""
			PlayerData.PlayerInventoty.append("Keycard0")
			book_close_anim()
		else:
			keypad.texture = keypad_wrong
			player.stream = wrong_sound
			user_input = ""
	else:
		keypad.texture = keypad_done
		player.stream = ok_sound
	player.play()
	yield(player, "finished")
	keypad.texture = keypad_normal

func _on_GoBack_pressed():
	SceneChanger.change_scene(GlobalData.ScenePath["ROOM_0"]["MAIN"])
