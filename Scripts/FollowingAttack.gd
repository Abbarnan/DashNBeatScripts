extends CharacterBody2D
var player : CharacterBody2D
var angle_in_Rad : float
var sprite = AnimatedSprite2D
var timer = Timer
var move_Attack = false 
var move_dir : Vector2
var dirNode : Node2D
@export var wait_time : float
@export var attackSpeed : int
@export var followTime : float
func _ready() -> void:
	player = $"../Character"
	sprite = $AnimatedSprite2D
	timer = $Timer
	sprite.play("Projection")
	timer.start(wait_time)
func degrees_Calculation():
	angle_in_Rad = atan2(player.position.y - position.y, player.position.x - position.x)
func _process(delta: float) -> void:
	if !move_Attack:
		transform.rotated(0.5)
		position+=Vector2(attackSpeed/2,attackSpeed/2)
	else:
		degrees_Calculation()
		sprite.play("Actual")
		move_dir = Vector2(cos(angle_in_Rad)*attackSpeed,sin(angle_in_Rad)*attackSpeed)
		position+=move_dir
func _on_timer_timeout() -> void:
	if !move_Attack:
		move_Attack = true
		timer.start(followTime)
	else:
		move_Attack = false
