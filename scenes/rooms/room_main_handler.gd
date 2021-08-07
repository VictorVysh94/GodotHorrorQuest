extends Control

export var RoomName = ""
export var RoomPart = ""
onready var inventory = load("res://objects/Interactive/inventory/show_bag.tscn").instance()

# Подготовка комнаты
func _ready():
	PlayerData.CurrentRoomName = RoomName
	PlayerData.CurrentRoomPart = RoomPart
	add_child(inventory) # Инвентарь
