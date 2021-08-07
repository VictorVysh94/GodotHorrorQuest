extends TextureButton

signal drop_correct

func _ready():
	if PlayerData.PlayerProgress["ROOM_0"]["ROOM_0_KEYCARD_UNLOCKED"]==true:
		queue_free()

func can_drop_data(_position, data):
	if data == "Keycard0":
		return data

func drop_data(_position, data):
	if data == "Keycard0":
		emit_signal("drop_correct")
		GlobalEffects.stream = load("res://sounds/enviroment/door_is_locked.wav")
		GlobalEffects.play()
		queue_free()
