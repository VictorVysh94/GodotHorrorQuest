extends TextureButton

signal drop_correct

func can_drop_data(_position, data):
	if data == "Pencil":
		return data

func drop_data(_position, data):
	if data == "Pencil":
		emit_signal("drop_correct")
