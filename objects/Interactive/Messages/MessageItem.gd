extends MarginContainer

onready var deathTime = 3

func _ready():
	$Timer.start(deathTime)

func _on_Timer_timeout():
	queue_free()

func set_txt(text):
	$Text.text = text
