extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var data1
	var data2
	var data3
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

		# Now we set the remaining variables.
		for i in node_data.keys():
			self.set(i, node_data[i])
			print(i)
			print(node_data[i])
		print(data1)
		print(data2)
		print(data3)
		print("end of data")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
