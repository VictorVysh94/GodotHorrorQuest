extends TextureRect

export var ItemName = ""

func _ready():
	for key in GlobalData.GameItems.keys():
		if GlobalData.GameItems[key]["picked"] == true and key == ItemName:
			queue_free()
		else:
			pass
