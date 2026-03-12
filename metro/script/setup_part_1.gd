extends Control

var Tile = 1
var disabled = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _input(_event: InputEvent) -> void:
	if disabled == false:
		if Input.is_action_just_pressed("a"):
			$"../Sounds/SndButtonselect".play()
			$"../Ambient".play()
			$AnimationPlayer.play("FadeOut")
			$"../Part2/AnimationPlayer".play("FadeIn")
			$"../Part2".show()
			disabled = true
			$"../Part2".disabled = false
			await $AnimationPlayer.animation_finished
			$".".hide()
