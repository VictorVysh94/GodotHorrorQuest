extends Node

# Для удобства обозначу все сцены тут, чтобы можно было обращаться к ним по имени
var ScenePath = {
	"ROOM_0":
		{
			"MAIN":"res://scenes/rooms/Room_0/Room_0_main.tscn",
			"DRAWER":"res://scenes/rooms/Room_0/DRAWER/Room_0_drawer.tscn",
			"WARDOBE":"res://scenes/rooms/Room_0/WARDOBE/Room_0_wardobe.tscn",
			"UV":"res://scenes/rooms/Room_0/UV/Room_0_UV.tscn",
			"BOOK":"res://scenes/rooms/Room_0/BOOK/ROOM_0_BOOK.tscn"
		},
	"CORRIDOR_0":
		{
			"MAIN":"res://scenes/corridors/corridor_0/corridor_0.tscn"
		},
	"MAIN_MENU":
		{
			"MAIN":"res://scenes/Main Menu/MainMenu.tscn",
			"SETTINGS":"res://scenes/Main Menu/Settings.tscn"
		}
}
# Список предметов, возможно стоит перевести его в формат json.
var GameItems = {
	"UVFlashlight":
		{
			"id":0,
			"name":"УФ Фонарь",
			"picked":false,
			"pickup_message":true,
			"description":"Ультрафиолетовый фонарик.Поможет при выключенном свете.",
			"icon_path":"res://sprites/room_0/icons/uv_flashlight.png"
		},
	"Ball_1":
		{
			"id":1,
			"name":"Шар",
			"picked":false,
			"pickup_message":false,
			"description":"Стеклянный шар, зеленого цвета",
			"icon_path":"res://sprites/room_0/icons/ball_1.png"
		},
	"Ball_2":
		{
			"id":2,
			"name":"Шар",
			"picked":false,
			"pickup_message":false,
			"description":"Стеклянный шар, фиолетового цвета",
			"icon_path":"res://sprites/room_0/icons/ball_2.png"
		},
	"Ball_3":
		{
			"id":3,
			"name":"Шар",
			"picked":false,
			"pickup_message":false,
			"description":"Стеклянный шар, красного цвета",
			"icon_path":"res://sprites/room_0/icons/ball_3.png"
		},
	"Pencil":
		{
			"id":4,
			"name":"Карандаш",
			"picked":false,
			"pickup_message":false,
			"description":"Самый обычный карандаш, возможно понадобиться что-то записать.",
			"icon_path":"res://sprites/room_0/icons/pencil.png"
		},
	"Key0":
		{
			"id":5,
			"name":"Ключ",
			"picked":false,
			"pickup_message":false,
			"description":"Самый обычный ключ, ничего особенного.",
			"icon_path":"res://sprites/room_0/icons/key0.png"
		},
	"Keycard0":
		{
			"id":6,
			"name":"Ключ-карта",
			"picked":false,
			"pickup_message":false,
			"description":"Ключ карта с NFC меткой, такими открывают двери.",
			"icon_path":"res://sprites/room_0/icons/keycard.png"
		},
	"PaperKey0":
		{
			"id":7,
			"name":"Листок бумаги",
			"picked":false,
			"pickup_message":false,
			"description":"Листок бумаги с рисунком.",
			"icon_path":"res://sprites/room_0/icons/paperkey.png"
		},
}
