extends Label
class_name Dragable_Word
var selectionne : bool = false
# Called when the node enters the scene tree for the first time.
var guess_array : Array
var rest_area : Area2D

signal rest_area_exited()
signal generate_curve()
signal start_moving()
signal stop_moving ()
@export var speed :int = 200

func _ready():
	randomize()
	guess_array = get_tree().get_nodes_in_group("Guess_words")
	var lst_rest_area =get_tree().get_nodes_in_group("Rest_word_Area")
	if lst_rest_area.size() >0 :
		rest_area = lst_rest_area[0]
		create_curve()
	$Drad_word_body/CollisionShape2D.shape.size = size
	$Drad_word_body.position = size/2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if selectionne :
		global_position = lerp(global_position, get_global_mouse_position() - size/2 ,25*delta)

func _on_panel_gui_input(event):
	if Input.is_action_just_pressed("Left_click") :
		selectionne = true
	elif Input.is_action_just_released("Left_click") :
		selectionne = false
		emit_signal("generate_curve")
		for empty_word in guess_array :
			print((global_position+size/2).distance_to(empty_word.global_position))
			if (global_position+size/2).distance_to(empty_word.global_position) < (empty_word as Guess_Word).distancemin :
				(empty_word as Guess_Word).set_word(self)

func create_curve() :
	if rest_area == null :
		return
	var new_curve = Curve2D.new()
	var first_point : Vector2 = global_position
	var second_point : Vector2 = (rest_area.global_position ) - (global_position -size/2) 
	var third_x : int = randi_range(0,get_viewport().size.x)
	var third_y : int = randi_range(0,get_viewport().size.y) 
	var third_point = Vector2(third_x,third_y)
	
	new_curve.add_point(first_point, position,(second_point-first_point)/2)
	new_curve.add_point(second_point, (third_point - first_point)/2, (first_point- third_point)/2)
	new_curve.add_point(third_point,(third_point -second_point)/2, Vector2.ZERO)
	
	return new_curve

func _on_drad_word_body_exited_rest_area():
	emit_signal("rest_area_exited")

func start():
	emit_signal("generate_curve")
	emit_signal("start_moving")

func stop():
	emit_signal("stop_moving")
