extends Control

@export var Title = "Title"
@export var Sub = "Sub"
@export var Fade = true
@export var Photo = Texture
@onready var Anim = $AnimationPlayer

func update():
	$Title.text = Title
	$Sub.text = Sub
	if Fade == true:
		$Fade.show()
	else:
		$Fade.hide()
	$Photo.texture = Photo
