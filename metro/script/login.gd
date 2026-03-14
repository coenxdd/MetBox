extends Control

var ProfileCount
var disabled = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Fade.show()
	GetProfileCount()
	$Fade/AnimationPlayer.play("FadeOut")

func GetProfileCount():
	var profilearray = DirAccess.get_directories_at("user://USERDATA/Profiles/")
	ProfileCount = profilearray.size()
	print("Found " + str(ProfileCount) + " Profiles")
	var loopcount = 1
	for I in range(0,ProfileCount):
		var thing = preload("res://scene/prof.tscn").instantiate()
		$Main/HBoxContainer.add_child(thing)
		
		var file = FileAccess.open("user://USERDATA/Profiles/" + str(loopcount) + "/profile.bin", FileAccess.READ)
		var metadict = JSON.parse_string(file.get_as_text())
		
		$Main/HBoxContainer/Prof.GamerTag = metadict.GamerTag
		$Main/HBoxContainer/Prof.GamerScore = int(metadict.GamerScore)
		$Main/HBoxContainer/Prof.XblEnabled = metadict.SignedIn
		
		if metadict.GamerPicCustom == false:
			var texture = load("res://assets/gamerpics/Gpic" + str(int(metadict.BInGamerPic)) + ".png")
			$Main/HBoxContainer/Prof.GamerPic = texture
		$Main/HBoxContainer/Prof.update()
		$Main/HBoxContainer/Prof.name = str(loopcount)
		loopcount += 1

func _input(_event: InputEvent) -> void:
	if disabled == false:
		if Input.is_action_just_pressed("a"):
			$Sounds/AcceptTile.play()
			Xbox.LoadSave(1)
			$Main/AnimationPlayer.play("FadeOut")
			disabled = true
			await $Main/AnimationPlayer.animation_finished
			await (get_tree().create_timer(1)).timeout
			await get_tree().process_frame
			get_tree().change_scene_to_file("res://scene/flash_dash.tscn")
