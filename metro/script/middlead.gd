extends Control

@export var Title = "Title"
@export var Sub = "Sub"
@export var Fade = true
@export var Photo = Texture
@onready var Anim = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func update():
	$Title.text = Title
	$Sub.text = Sub
	if Fade == true:
		$Fade.show()
	else:
		$Fade.hide()
	$Photo.texture = Photo
