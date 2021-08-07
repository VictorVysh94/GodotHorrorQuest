extends "res://scenes/rooms/room_main_handler.gd"

onready var background : TextureRect = $Background
onready var no_paper = preload("res://sprites/room_0/background/wardobe_no_paper.png")
onready var paper = preload("res://sprites/room_0/background/wardobe_paper.png")

func _ready():
	if "PaperKey0" in PlayerData.PlayerInventoty:
		background.texture = no_paper
	else:
		background.texture = paper
