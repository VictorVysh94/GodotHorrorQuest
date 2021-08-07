extends AudioStreamPlayer

onready var TweenNode = $Tween
onready var low_value = -80
onready var user_value = -20
onready var max_value = 20

func play_music(song):
	stream = load(song)
	play()
	TweenNode.interpolate_property(self,"volume_db",low_value,user_value,8,Tween.TRANS_LINEAR,Tween.EASE_IN,0)
	TweenNode.start()

func play_music_preload(song):
	stream = song
	play()
	TweenNode.interpolate_property(self,"volume_db",low_value,user_value,8,Tween.TRANS_LINEAR,Tween.EASE_IN,0)
	TweenNode.start()
