extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Main/Social/Friends/AnimationPlayer.play("Up")
	$Main/Home/Disc/AnimationPlayer.play("Up")
	$Main/Video/VideoApps/AnimationPlayer.play("Up")
	$Main/Home/Disc.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
