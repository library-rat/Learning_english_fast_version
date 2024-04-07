extends Control

var json_as_text = FileAccess.get_file_as_string("res://assets/text_Jsonified.json")
var json_dict = JSON.parse_string(json_as_text)
var lvlselector = load("res://level_selector.tscn")
var currentlvl = {}
var layout = {}
signal display_level(dico)
# Called when the node enters the scene tree for the first time.
func _ready():
	load_currentlvl()
	for key in json_dict.keys() :
		var newLvl = lvlselector.instantiate()
		newLvl.set_value(key)
		newLvl.set_level(currentlvl[key], json_dict[key].size())
		newLvl.connect( "level_selected", choose_level)
		$SelectorContainer.add_child(newLvl) 
		layout[key] = newLvl

		


func load_currentlvl():
	if not FileAccess.file_exists("user://savegame.save"):
		for keys in json_dict.keys() :
			currentlvl[keys] = 0
		save_progression()
		return
	else :
		var save_game = FileAccess.open("user://savegame.save", FileAccess.READ)
		var load_string  = save_game.get_line()
		currentlvl = JSON.parse_string(load_string)
		if currentlvl == {} :
			for keys in json_dict.keys() :
				currentlvl[keys] = 0
				save_progression()
	
	
func save_progression():
	var savegame = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var save_string = JSON.stringify(currentlvl)
	savegame.store_line(save_string)


func choose_level(key : String) -> void :
	if currentlvl[key] <json_dict[key].size() :
		print(json_dict[key][currentlvl[key]])
		display_level.emit(json_dict[key][currentlvl[key]])
		await $"../Main_Scene".level_passed
		print("it's alright")
		currentlvl[key] += 1
		save_progression()
		layout[key].set_level(currentlvl[key], json_dict[key].size())
	
