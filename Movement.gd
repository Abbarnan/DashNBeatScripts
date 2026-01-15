extends CharacterBody2D
@export var currentSpeed : int
var is_sprinting: bool = false
var animated_sprite: AnimatedSprite2D
var battling = false

func _ready():
	animated_sprite = $AnimatedSprite2D
func get_input():
	var inputDir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = inputDir * currentSpeed
	"""
	match inputDir:
		Vector2(1,0):
			velocity = inputDir * currentSpeed
		Vector2(-1,0):
			velocity = inputDir * currentSpeed
		Vector2(0,-1):
			velocity = inputDir * currentSpeed
		Vector2(0,1):
			velocity = inputDir * currentSpeed
		Vector2.ZERO:
			velocity = Vector2(0,0)
	"""
func _physics_process(delta):
	get_input()
	move_and_collide(velocity * delta)
