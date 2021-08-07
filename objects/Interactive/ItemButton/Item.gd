extends TextureButton

# Название нашего предмета в "базе"
export var ItemName : String = ""

# При загрузке мы проверяем был предмет уже взят.
func _ready():
	if ItemName == "":
		push_error("Item name incorrect")
	for key in GlobalData.GameItems.keys():
		if GlobalData.GameItems[key]["picked"] == true and key == ItemName:
			queue_free()
		else:
			pass

# А при нажатии нужно найти нужный предмет, выставить "поднято".
# Сообщить игроку о том, что же мы подобрали.
func _on_Item_pressed():
	PlayerData.PlayerInventoty.append(ItemName)
	for key in GlobalData.GameItems.keys():
		if key == ItemName:
			get_tree().call_group("inventory","clear_and_set")
			GlobalData.GameItems[key]["picked"] = true
			if GlobalData.GameItems[key]["pickup_message"]==true:
				GlobalMessageBox.send_msg(GlobalData.GameItems[key]["description"])
			else:
				pass
			#get_tree().call_group("MessageBox", "create_msg",GlobalData.GameItems[key]["description"])
	queue_free()
