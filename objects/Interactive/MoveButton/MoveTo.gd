extends TextureButton

export var location_name : String = "" # Для перехода мы указываем комнату
export var location_part : String = "" # Для перехода мы указываем сцену комнаты
export var time : int = 0 # 1 И время ожидания
export var sound : String = "res://" # Так же не забываем про звук перехода
export var playSound : bool = true # Нужен ли звук
export var returning : bool = false # Возвращаемся ли мы в последнюю комнату
onready var wasPressed : bool = false # Нажали ли мы кнопку

func _ready():
	# Нам необходимо знать когда у нас произошло затемнение
	#var _cnct = SceneChanger.connect("scene_faded",self,"scene_fade_finished")
	pass

func _on_MoveTo_pressed():
	wasPressed = true # Это у нас нажали кнопку
	if time > 0: # Если работаем по таймеру, то запускаем его
		$WaitUntilGo.start(time)
	else:
		change_scene()
	# Если работаем по звуку, то ждём сигнала
	if playSound == true:
		GlobalEffects.play_effect(sound)

func _on_WaitUntilGo_timeout():# Если работаем по таймеру
	change_scene()

func change_scene():
	if returning == true:
		SceneChanger.change_scene(GlobalData.ScenePath[PlayerData.LastRoomName][PlayerData.LastRoomPart])
	else:
		SceneChanger.change_scene(GlobalData.ScenePath[location_name][location_part])
	PlayerData.LastRoomName = PlayerData.CurrentRoomName
	PlayerData.LastRoomPart = PlayerData.CurrentRoomPart

#func scene_fade_finished():
#	if playSound == true and wasPressed == true:
#		GlobalEffects.play_effect(sound)
