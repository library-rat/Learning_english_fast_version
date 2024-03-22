extends Control

func open_error_window(text: String):
	$ErrorWindow/Label.text = text
	$ErrorWindow.visible = true
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	$ErrorWindow.visible = false
