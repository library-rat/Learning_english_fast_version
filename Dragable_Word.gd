extends Label

var selectionne : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if selectionne :
		global_position = lerp(global_position, get_global_mouse_position() - size/2 ,25*delta)


func _on_panel_gui_input(event):
	if Input.is_action_just_pressed("Left_click") :
		selectionne = true
	elif Input.is_action_just_released("Left_click") :
		selectionne = false
