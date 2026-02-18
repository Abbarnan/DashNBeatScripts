extends CharacterBody2D
var sprite = AnimatedSprite2D
var timer = Timer
var attackMove = false
var angle : float
@export var wait_time : float
@export var attackSpeed : int
func _ready() -> void:
	sprite = $AnimatedSprite2D
	timer = $Timer
	sprite.play("Projection")
	timer.start(wait_time)
func _process(delta: float) -> void:
	if attackMove:
		var move_dir = Vector2(cos(angle*-1)*attackSpeed,sin(angle)*attackSpeed)
		position+= move_dir

func _on_timer_timeout() -> void:
	angle = transform.get_rotation()
	sprite.play("Actual")
	attackMove = true
	
