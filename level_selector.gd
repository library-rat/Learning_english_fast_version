extends HBoxContainer
var value : String 

signal level_selected(text :String)

func set_value(value):
	self.value = value
	$Panel/Label.text = value

func set_level(current:int, max :int):
	if current < max :
		$Label.text = "%d/%d"% [current,max]
	else :
		$Label.text = "END"

func _on_gui_input(event):
	if event.is_action_pressed("Left_click"):
		level_selected.emit(value)
