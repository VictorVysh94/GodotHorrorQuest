extends AudioStreamPlayer

onready var low_value = -80
onready var user_value = -20
onready var max_value = 20

func play_effect(path):
	stream = load(path)
	play()

func play_effect_preloaded(sound):
	stream = sound
	play()
