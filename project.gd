extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_home_screen_display_level(dico):
	$HomeScreen.visible = false
	$Main_Scene.visible = true
	$Main_Scene.set_level(dico)


func _on_button_pressed():
	$ErrorWindow.visible = false


func _on_main_scene_level_passed():
		$HomeScreen.visible = true
		$Main_Scene.visible = false
		$ErrorWindow.visible = true
