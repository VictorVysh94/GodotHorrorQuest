extends TextureButton

export(String) var Key
signal pressed_key(KeyNumber)

func _on_pressed():
	emit_signal("pressed_key",Key)
