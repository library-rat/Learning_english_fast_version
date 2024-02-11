extends Label
class_name Guess_Word
var distancemin: int =  30
# Called when the node enters the scene tree for the first time.
func _ready():
	text = "THis is a loooooooooooooooooooooooooong text"
	print(size)

func _draw ():
	print(distancemin)
	draw_circle(size/2, distancemin, Color.WHITE)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
