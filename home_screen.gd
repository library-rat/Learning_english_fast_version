extends Control

var json_as_text = FileAccess.get_file_as_string("res://assets/text_Jsonified.json")
var json_dict = JSON.parse_string(json_as_text)
var lvlselector = load("res://level_selector.tscn")
var currentlvl = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	for key in json_dict.keys() :
		var newLvl = lvlselector.instantiate()
		newLvl.set_value(key)
		$SelectorContainer.add_child(newLvl) 
	load_currentlvl()


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
		print(currentlvl)
	
	
func save_progression():
	var savegame = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var save_string = JSON.stringify(currentlvl)
	savegame.store_line(save_string)
