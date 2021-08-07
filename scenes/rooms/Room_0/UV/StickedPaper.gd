extends TextureButton

func _ready():
	if GlobalData.GameItems["PaperKey0"]["picked"] == true:
		queue_free()
	else:
		pass
