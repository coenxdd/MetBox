extends Node

var profiledict

var GamerTag = "Player1"
var GamerScore = 0
var SignedIn = false
var RAusername = "RA Username"
var RAapikey = "RA api key here"
var GamerPicCustom = false
var BInGamerPic = 1
var ProfileID = 1
var CustomGamerPicID = 0

var GamerPicTexture
#just for convenience

func UpdateSave():
	profiledict = {
		"GamerTag" : GamerTag,
		"GamerScore" : GamerScore,
		"SignedIn" : SignedIn,
		"RAusername" : RAusername,
		"RAapikey" : RAapikey,
		"GamerPicCustom" : GamerPicCustom,
		"BInGamerPic" : BInGamerPic,
		"ProfileID" : ProfileID,
	}
	print("Saving Profile...")
	if DirAccess.dir_exists_absolute("user://USERDATA/Profiles/" + str(ProfileID)):
		var save_file = FileAccess.open("user://USERDATA/Profiles/" + str(ProfileID) + "/profile.bin", FileAccess.WRITE)
		var json_string = JSON.stringify(profiledict)
		save_file.store_line(json_string)
	else:
		DirAccess.make_dir_absolute("user://USERDATA/Profiles/" + str(ProfileID))
		var save_file = FileAccess.open("user://USERDATA/Profiles/" + str(ProfileID) + "/profile.bin", FileAccess.WRITE)
		var json_string = JSON.stringify(profiledict)
		save_file.store_line(json_string)

func LoadSave(pID):
	if FileAccess.file_exists("user://USERDATA/Profiles/" + str(pID) + "/profile.bin"):
		print("Found Profile! Loading...")
		var file = FileAccess.open("user://USERDATA/Profiles/" + str(pID) + "/profile.bin", FileAccess.READ)
		var text = file.get_as_text()
		var data = JSON.parse_string(text)
		profiledict = data
		print(data)
		GamerTag = profiledict.GamerTag
		GamerScore = profiledict.GamerScore
		SignedIn = profiledict.SignedIn
		RAusername = profiledict.RAusername
		RAapikey = profiledict.RAapikey
		GamerPicCustom = profiledict.GamerPicCustom
		BInGamerPic = profiledict.BInGamerPic
		ProfileID = profiledict.ProfileID
		
		if GamerPicCustom == false:
			var texture = load("res://assets/gamerpics/Gpic" + str(int(BInGamerPic)) + ".png")
			GamerPicTexture = texture
	else:
		print("Profile " + str(pID) + " does not exist")
		pass
