extends VBoxContainer

onready var preload_msg = load("res://objects/Interactive/Messages/MessageItem.tscn")

func create_msg(text):
	var _msg = preload_msg.instance()
	_msg.set_txt(text)
	add_child(_msg)
