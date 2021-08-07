extends Node2D


onready var MSGBOX = $Control/MessageBox

func send_msg(text):
	MSGBOX.create_msg(text)
