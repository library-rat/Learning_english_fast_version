extends Label

var selectionne : bool = false
# Called when the node enters the scene tree for the first time.
var guess_array : Array

func _ready():
	guess_array = get_tree().get_nodes_in_group("Guess_words")
	print(guess_array)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if selectionne :
		global_position = lerp(global_position, get_global_mouse_position() - size/2 ,25*delta)


func _on_panel_gui_input(event):
	if Input.is_action_just_pressed("Left_click") :
		selectionne = true
	elif Input.is_action_just_released("Left_click") :
		selectionne = false
		for empty_word in guess_array :
			if (global_position+size/2).distance_to(empty_word.global_position + empty_word.size/2) < (empty_word as Guess_Word).distancemin :
				print("I'm in")
