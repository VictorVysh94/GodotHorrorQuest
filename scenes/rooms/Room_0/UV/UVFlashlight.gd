extends Light2D

onready var TweenNode = $Tween
onready var max_light = 1

func _input(event):
	if event is InputEventMouseMotion:
		light_pos()

func turn_on_flashlight():
	var temp_e = 0
	var temp_e2 = max_light
	var _ret
	_ret = TweenNode.interpolate_property(self, "energy",
		temp_e, temp_e2, 10,
		Tween.TRANS_ELASTIC, Tween.EASE_OUT,1.5)
	_ret = TweenNode.start()

func turn_off_flashlight():
	var temp_e = max_light
	var temp_e2 = 0
	var _ret
	_ret = TweenNode.interpolate_property(self, "energy",
		temp_e, temp_e2, 5,
		Tween.TRANS_ELASTIC, Tween.EASE_OUT)
	_ret = TweenNode.start()

func light_pos():
	position = get_global_mouse_position()
	$AudioStreamPlayer2D.position = position	
