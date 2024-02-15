extends Path2D

@onready var Dragable_word : Dragable_Word = $Follower/Dragable_Word
var is_stopped: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	curve = Dragable_word.create_curve()


# Called every frame. 'delta' is the² elapsed time since the previous frame.
func _physics_process(delta):
	if is_stopped:
		return
	
	if Dragable_word.selectionne == false :
		$Follower.progress +=  Dragable_word.speed*delta
		if $Follower.progress_ratio == 1 :
			curve = Dragable_word.create_curve()
			$Follower.progress_ratio = 0




func _on_dragable_word_generate_curve():
	curve = Dragable_word.create_curve()
	$Follower.progress_ratio =0
	Dragable_word.position = Vector2.ZERO

func _on_dragable_word_rest_area_exited():
	if !Dragable_word.selectionne:
		curve = Dragable_word.create_curve()
		$Follower.progress_ratio = 0


func _on_dragable_word_start_moving():
	is_stopped = false


func _on_dragable_word_stop_moving():
	is_stopped = true
