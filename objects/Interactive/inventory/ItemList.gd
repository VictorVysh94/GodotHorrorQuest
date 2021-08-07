extends ItemList

func get_drag_data(_position):
	var img : TextureRect = load("res://objects/Interactive/inventory/Preview_drag.tscn").instance()
	if len(get_selected_items())>0:
		img.texture = load(GlobalData.GameItems[PlayerData.PlayerInventoty[get_selected_items()[0]]]["icon_path"])
		set_drag_preview(img)
		return PlayerData.PlayerInventoty[get_selected_items()[0]]

#func can_drop_data(position, data):
#	print(data)
#	return data

#func drop_data(_position, data):
#	print(data)
