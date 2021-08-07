extends CanvasLayer

signal scene_changed()
signal scene_faded()

onready var animation_player = $AnimationPlayer
onready var black = $Control/BlackRect

func change_scene(path,delay = 0.5):
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	yield(get_tree().create_timer(delay),"timeout")
	animation_player.play("fade")
	yield(animation_player, "animation_finished")
	emit_signal("scene_faded")
	yield(get_tree().create_timer(delay),"timeout")
	assert(get_tree().change_scene(path) == OK)
	animation_player.play("back_fade")
	emit_signal("scene_changed")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
