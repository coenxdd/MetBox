extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$DevMenu/Version.text = str(ProjectSettings.get_setting("application/config/version"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_boot_dash_pressed() -> void:
	$DevMenu/SndButtonselect.play()
	get_tree().change_scene_to_file("res://scene/flash_dash.tscn")

func _on_boot_setup_pressed() -> void:
	$DevMenu/SndButtonselect.play()
	get_tree().change_scene_to_file("res://scene/setup.tscn")

func _on_boot_login_pressed() -> void:
	$DevMenu/SndButtonselect.play()
	get_tree().change_scene_to_file("res://scene/login.tscn")

func _on_pi_dset_pressed() -> void:
	Xbox.LoadSave(int($DevMenu/ProfileOptions/PIDtext.value))
	$DevMenu/GamerPic.texture = Xbox.GamerPicTexture
	$DevMenu/GamerTag.text = Xbox.GamerTag
