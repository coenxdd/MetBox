extends Control

var Tile = 1
var disabled = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _input(_event: InputEvent) -> void:
	if disabled == false:
		if Input.is_action_just_pressed("up"):
			if Tile == 2:
				$"../../Sounds/Select2".play()
				$SocialApps/AnimationPlayer.play("Down")
				$Friends/AnimationPlayer.play("Up")
				Tile = 1
				$Friends.grab_focus()
			elif Tile == 3:
				$"../../Sounds/Select2".play()
				$SignInOut/AnimationPlayer.play("Down")
				$SocialApps/AnimationPlayer.play("Up")
				Tile = 2
				$SocialApps.grab_focus()
		elif Input.is_action_just_pressed("down"):
			if Tile == 1:
				$"../../Sounds/Select2".play()
				$SocialApps/AnimationPlayer.play("Up")
				$Friends/AnimationPlayer.play("Down")
				Tile = 2
				$SocialApps.grab_focus()
			elif Tile == 2:
				$"../../Sounds/Select2".play()
				$SignInOut/AnimationPlayer.play("Up")
				$SocialApps/AnimationPlayer.play("Down")
				Tile = 3
				$SignInOut.grab_focus()
		elif Input.is_action_just_pressed("right"):
			disabled = true
			$"../../Sounds/ChangeTab3".play()
			$AnimationPlayer.play("SlideOutToLeft")
			$"../TabsText/Video".modulate.a = 1
			$"../TabsText/Social".modulate.a = 0.5
			$"../Video/AnimationPlayer".play("SlideInToRight")
			$"../Video".show()
			if $"../Video".Tile == 1:
				$"../Video/VideoApps".grab_focus()
			elif $"../Video".Tile == 2:
				$"../Video/VideoMarket".grab_focus()
			await $AnimationPlayer.animation_finished
			$".".hide()
			$"../Video".disabled = false
		elif Input.is_action_just_pressed("left"):
			disabled = true
			$"../../Sounds/ChangeTab".play()
			$AnimationPlayer.play("SlideOutToRight")
			$"../TabsText/Home".modulate.a = 1
			$"../TabsText/Social".modulate.a = 0.5
			$"../Home/AnimationPlayer".play("SlideInToLeft")
			$"../Home".show()
			if $"../Home".Tile == 4:
				$"../Home/SideAD".grab_focus()
			elif $"../Home".Tile == 5:
				$"../Home/SideAD2".grab_focus()
			await $AnimationPlayer.animation_finished
			$".".hide()
			$"../Home".disabled = false
			
