extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Fade.show()
	$Fade/AnimationPlayer.play("FadeOut")
	await $Fade/AnimationPlayer.animation_finished
	$Fade.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
