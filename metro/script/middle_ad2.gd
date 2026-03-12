extends Button

var CurrentAd = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	loop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func loop():
	while true:
		await get_tree().create_timer(10).timeout
		if CurrentAd == $Ads.get_child_count():
			get_node("Ads/" + str(CurrentAd)).Anim.play("slideout")
			get_node("Ads/1").Anim.play("slidein")
			get_node("Ads/1").show()
			await get_node("Ads/" + str(CurrentAd)).Anim.animation_finished
			get_node("Ads/" + str(CurrentAd)).hide()
			get_node("../MidAdAds/" + str(CurrentAd)).modulate.a = 0.5
			CurrentAd = 1
			get_node("../MidAdAds/" + str(CurrentAd)).modulate.a = 1
		else:
			get_node("Ads/" + str(CurrentAd)).Anim.play("slideout")
			get_node("Ads/" + str(CurrentAd + 1)).Anim.play("slidein")
			get_node("Ads/" + str(CurrentAd + 1)).show()
			await get_node("Ads/" + str(CurrentAd)).Anim.animation_finished
			get_node("Ads/" + str(CurrentAd)).hide()
			get_node("../MidAdAds/" + str(CurrentAd)).modulate.a = 0.5
			CurrentAd = CurrentAd + 1
			get_node("../MidAdAds/" + str(CurrentAd)).modulate.a = 1
