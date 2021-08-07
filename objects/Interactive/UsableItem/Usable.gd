extends TextureRect


export var UsableItem = ""
export var GroupName = ""
export var Func = ""
export(Array,String) var OtherData

func can_drop_data(_position, data):
	if data == UsableItem:
		#get_tree().call_group(GroupName,Func,OtherData)
		return data

func drop_data(_position, _data):
	get_tree().call_group(GroupName,Func,OtherData)
