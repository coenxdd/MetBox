extends Panel

@export var GamerTag = "Player1"
@export var GamerScore = 0
@export var XblEnabled = false
@export var GamerPic = Texture

func update():
	$GamerTag.text = GamerTag
	$GamerScore/Score.text = str(GamerScore)
	if XblEnabled == true:
		$XblEnabled.show()
	else:
		$XblEnabled.hide()
	$GamerPic.texture = GamerPic
