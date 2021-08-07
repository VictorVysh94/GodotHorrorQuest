extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var inv : ItemList = $MarginContainer/ItemList
onready var cnt : MarginContainer = $MarginContainer
onready var twn : Tween = $Tween
onready var invicon : TextureButton = $InvIcon

onready var isHidden = true
onready var animation_finished = true

func open_inventory():
	if animation_finished == true:
		if isHidden==true:
			show_inv()
			isHidden=false
		else:
			hide_inv()
			isHidden=true

func hide_inv():
	var _ret
	animation_finished = false
	var temp_pos_1 = cnt.rect_position
	var temp_pos_2 = cnt.rect_position
	temp_pos_2.y = temp_pos_2.y + 250
	_ret = twn.interpolate_property(cnt, "rect_position",
		temp_pos_1, temp_pos_2, 0.3,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	var temp_pos_3 = invicon.rect_position
	var temp_pos_4 = invicon.rect_position
	temp_pos_4.y = temp_pos_4.y + 250
	_ret = twn.interpolate_property(invicon, "rect_position",
		temp_pos_3, temp_pos_4, 0.3,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	_ret = twn.start()

func show_inv():
	var _ret
	animation_finished = false
	var temp_pos_1 = cnt.rect_position
	var temp_pos_2 = cnt.rect_position
	temp_pos_2.y = temp_pos_2.y - 250
	_ret = twn.interpolate_property(cnt, "rect_position",
		temp_pos_1, temp_pos_2, 0.3,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		
	var temp_pos_3 = invicon.rect_position
	var temp_pos_4 = invicon.rect_position
	temp_pos_4.y = temp_pos_4.y - 250
	_ret = twn.interpolate_property(invicon, "rect_position",
		temp_pos_3, temp_pos_4, 0.3,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	_ret = twn.start()

func clear_and_set():
	inv.clear()
	for item in PlayerData.PlayerInventoty:
		inv.add_item(GlobalData.GameItems[item]["name"],load(GlobalData.GameItems[item]["icon_path"]),true)
		inv.set_item_tooltip(inv.get_item_count()-1,GlobalData.GameItems[item]["description"])

func _on_Tween_tween_completed(_object, _key):
	animation_finished = true

func _on_InvIcon_pressed():
	clear_and_set()
	open_inventory()

