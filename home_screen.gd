extends Control

var json_as_text = FileAccess.get_file_as_string("res://assets/text_Jsonified.json")
var json_dict = JSON.parse_string(json_as_text)
var lvlselector = load("res://level_selector.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	for key in json_dict.keys() :
		var newLvl = lvlselector.instantiate()
		newLvl.set_value(key)
		$SelectorContainer.add_child(newLvl) 
