extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var vocab_level : int
	var conj_level : int
	var gram_level : int
	#var save_game = FileAccess.open("user://savegame.save", FileAccess.WRITE)

	#var node_data = {
		#"data1" : "the data is one",
		#"data2" : 2,
		#"data3" : Vector2(3,3)
		#}

		# JSON provides a static method to serialized JSON string.
#	var json_string = JSON.stringify(node_data)

		# Store the save dictionary as a new line in the save file.
	#save_game.store_line(json_string)

	if not FileAccess.file_exists("user://savegame.save"):
		return # Error! We don't have a save to load.

	# We need to revert the game state so we're not cloning objects
	# during loading. This will vary wildly depending on the needs of a
	# project, so take care with this step.
	# For our example, we will accomplish this by deleting saveable objects.
	
	# Load the file line by line and process that dictionary to restore
	# the object it represents.
	var save_game = FileAccess.open("user://savegame.save", FileAccess.READ)
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()

		# Creates the helper class to interact with JSON
		var json = JSON.new()

		# Check if there is any error while parsing the JSON string, skip in case of failure
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		# Get the data from the JSON object
		var node_data = json.get_data()
		vocab_level = node_data["vocab"]
		conj_level = node_data["conj"]
		gram_level = node_data["gram"]
		# Now we set the remaining variables.
		$VBoxContainer/Vocabulaire/Quota.text = str(vocab_level)+"/10"
		$VBoxContainer/Conjugaison/Quota.text = str(conj_level)+"/10"
		$VBoxContainer/Grammaire/Quota.text = str(gram_level)+"/10"

# Called every frame. 'delta' is the elapsed time since the previous frame.

func save_game():
	var save_game = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		# Check the node is an instanced scene so it can be instanced again during load.
		if node.scene_file_path.is_empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue

		# Check the node has a save function.
		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue

		# Call the node's save function.
		var node_data = node.call("save")

		# JSON provides a static method to serialized JSON string.
		var json_string = JSON.stringify(node_data)

		# Store the save dictionary as a new line in the save file.
		save_game.store_line(json_string)
