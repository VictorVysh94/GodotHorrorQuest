extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if PlayerData.PlayerProgress["ROOM_0"]["ROOM_0_KEYCARD_UNLOCKED"] == true:
		queue_free()
