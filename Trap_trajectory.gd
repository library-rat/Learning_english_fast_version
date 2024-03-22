extends Word_Trajectory
class_name Trap_Trajectory

var message : String 

func set_message (text : String):
	$Follower/Dragable_Word.message = text
# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready()
	$Follower/Dragable_Word.add_to_group("Trap")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
