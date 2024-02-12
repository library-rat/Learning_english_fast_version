extends Path2D

@onready var Dragable_word : Dragable_Word = $Follower/Dragable_Word
# Called when the node enters the scene tree for the first time.
func _ready():
	curve = Dragable_word.create_curve()


# Called every frame. 'delta' is the² elapsed time since the previous frame.
func _physics_process(delta):
	$Follower.progress +=  Dragable_word.speed*delta
	print($Follower.position)
	if $Follower.progress_ratio == 1 :
		curve = Dragable_word.create_curve()
		position = Dragable_word.position
		$Follower.progress_ratio = 0
