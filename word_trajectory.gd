extends Path2D

@onready var Dragable_word : Dragable_Word = $Follower/Dragable_Word
# Called when the node enters the scene tree for the first time.
func _ready():
	curve = Dragable_word.create_curve()


# Called every frame. 'delta' is the² elapsed time since the previous frame.
func _physics_process(delta):
	if Dragable_word.selectionne == false :
		$Follower.progress +=  Dragable_word.speed*delta
		print($Follower.position)
		if $Follower.progress_ratio == 1 :
			curve = Dragable_word.create_curve()
			$Follower.progress_ratio = 0


func _on_dragable_word_rest_area_exited():
	curve = Dragable_word.create_curve()
	$Follower.progress_ratio = 0


func _on_dragable_word_just_released():
	curve = Dragable_word.create_curve()
	Dragable_word.position = Vector2.ZERO
