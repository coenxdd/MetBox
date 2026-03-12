extends Control

var Tile = 1
var disabled = false
var Tempvar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MiddleAD/HTTPRequest.request("https://xbl.toonix.ink/spotlight/pull.json")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _input(_event: InputEvent) -> void:
	if disabled == false:
		if Input.is_action_just_pressed("up"):
			if Tile == 2:
				$"../../Sounds/Select2".play()
				$QuickPlay/AnimationPlayer.play("Down")
				$Disc/AnimationPlayer.play("Up")
				Tile = 1
				$Disc.grab_focus()
			elif Tile == 5:
				$"../../Sounds/Select2".play()
				$SideAD2/AnimationPlayer.play("Down")
				$SideAD/AnimationPlayer.play("Up")
				Tile = 4
				$SideAD.grab_focus()
		elif Input.is_action_just_pressed("down"):
			if Tile == 4:
				$"../../Sounds/Select2".play()
				$SideAD2/AnimationPlayer.play("Up")
				$SideAD/AnimationPlayer.play("Down")
				Tile = 5
				$SideAD2.grab_focus()
			elif Tile == 1:
				$"../../Sounds/Select2".play()
				$QuickPlay/AnimationPlayer.play("Up")
				$Disc/AnimationPlayer.play("Down")
				Tile = 2
				$QuickPlay.grab_focus()
		elif Input.is_action_just_pressed("right"):
			if Tile == 2:
				$"../../Sounds/Select2".play()
				$QuickPlay/AnimationPlayer.play("Down")
				$MiddleAD/AnimationPlayer.play("Up")
				Tile = 3
				$MiddleAD.grab_focus()
			elif Tile == 1:
				$"../../Sounds/Select2".play()
				$Disc/AnimationPlayer.play("Down")
				$MiddleAD/AnimationPlayer.play("Up")
				Tile = 3
				$MiddleAD.grab_focus()
			elif Tile == 3:
				$"../../Sounds/Select2".play()
				$MiddleAD/AnimationPlayer.play("Down")
				$SideAD/AnimationPlayer.play("Up")
				Tile = 4
				$SideAD.grab_focus()
			elif Tile == 5 or Tile == 4:
				disabled = true
				$"../../Sounds/ChangeTab3".play()
				$AnimationPlayer.play("SlideOutToLeft")
				$"../TabsText/Social".modulate.a = 1
				$"../TabsText/Home".modulate.a = 0.5
				$"../Social/AnimationPlayer".play("SlideInToRight")
				$"../Social".show()
				if $"../Social".Tile == 1:
					$"../Social/Friends".grab_focus()
				elif $"../Social".Tile == 2:
					$"../Social/SocialApps".grab_focus()
				elif $"../Social".Tile == 3:
					$"../Social/SignInOut".grab_focus()
				await $AnimationPlayer.animation_finished
				$".".hide()
				$"../Social".disabled = false
				
		elif Input.is_action_just_pressed("left"):
			if Tile == 3:
				$"../../Sounds/Select2".play()
				$MiddleAD/AnimationPlayer.play("Down")
				$Disc/AnimationPlayer.play("Up")
				Tile = 1
				$Disc.grab_focus()
			elif Tile == 4:
				$"../../Sounds/Select2".play()
				$SideAD/AnimationPlayer.play("Down")
				$MiddleAD/AnimationPlayer.play("Up")
				Tile = 3
				$MiddleAD.grab_focus()
			elif Tile == 5:
				$"../../Sounds/Select2".play()
				$SideAD2/AnimationPlayer.play("Down")
				$MiddleAD/AnimationPlayer.play("Up")
				Tile = 3
				$MiddleAD.grab_focus()

func _on_middlead_request_completed(_result: int, _response_code: int, _headers: PackedStringArray, body: PackedByteArray) -> void:
	var json1 = JSON.parse_string(body.get_string_from_utf8())
	var ads = int(json1["Ads"])
	print(ads)
	var loopcount = 1
	for I in range(0,ads):
		var ad = json1["ad" + str(loopcount)]
		var thing = preload("res://scene/middlead.tscn").instantiate()
		$MiddleAD/Ads.add_child(thing)
		await get_tree().create_timer(0.001).timeout
		get_node("MiddleAD/Ads/Ad1").name = str(loopcount)
		Tempvar = loopcount
		get_node("MiddleAD/Ads/" + str(loopcount)).Title = ad["Title"]
		get_node("MiddleAD/Ads/" + str(loopcount)).Sub = ad["Desc"]
		get_node("MiddleAD/Ads/" + str(loopcount)).Fade = ad["Fade"]
		$MiddleAD/GetAdImage.request(ad["Image"])
		await $MiddleAD/GetAdImage.request_completed
		get_node("MiddleAD/Ads/" + str(loopcount)).update()
		var legend = preload("res://scene/adnumb.tscn").instantiate()
		$MidAdAds.add_child(legend)
		get_node("MidAdAds/AdNumb").name = str(loopcount)
		loopcount += 1
	get_node("MiddleAD/Ads/1").show()
	get_node("MidAdAds/1").modulate.a = 1

func _on_get_ad_image_request_completed(_result: int, _response_code: int, _headers: PackedStringArray, body: PackedByteArray) -> void:
	var image = Image.new()
	image.load_png_from_buffer(body)
	var texture=ImageTexture.create_from_image(image)
	get_node("MiddleAD/Ads/" + str(Tempvar)).Photo = texture
