extends Node


# Последняя комната, в которую мы заходили. Ну по крайней мере через MoveTo должно быть сохранение этой позиции.
var LastRoomName = ""
var LastRoomPart = ""
var CurrentRoomName = ""
var CurrentRoomPart = ""
# Инвентарь, просто хранимые предметы
var PlayerInventoty = []

# Уведомления, для того, чтобы не оповещать по 100 раз одинаковые вещи.
var PlayerNotificationsMessages = {
	"ROOM_0_BOOK":false,
	"ROOM_0_PANEL":false
}

# Прогресс для каждой из комнат.
var PlayerProgress = {
	"ROOM_0":
		{
			"ROOM_0_BOOK":false,
			"ROOM_0_BOOK_KEYCARD":false,
			"ROOM_0_KEYCARD_UNLOCKED":false
		}
}

# Скримеры? Чтобы не бесили тоже используем их по определенным параметрам.
var PlayerSawScreamers = {
	"ROOM_0":
		{
			"used":false,
			"reusable":false
		}
}
