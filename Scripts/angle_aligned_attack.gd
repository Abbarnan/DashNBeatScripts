extends CharacterBody2D
var player : CharacterBody2D
var angle_in_Rad : float
var rotation_direction : int
var sprite = AnimatedSprite2D
var timer = Timer
var move_Attack = false
var slope : int
var right_side_node : Node2D 
var move_dir : Vector2
var dirNode : Node2D
@export var wait_time : int;
@export var attackSpeed : int
@export var dashSpeed : int
func _ready() -> void:
	player = $"../Character"
	sprite = $AnimatedSprite2D
	timer = $Timer
	right_side_node = $"RS node"
	sprite.play("Projection")
	timer.start(wait_time)
func degrees_Calculation():
	angle_in_Rad = atan2(player.position.y - position.y, player.position.x - position.x)
func _process(delta: float) -> void:
	if !move_Attack:
		degrees_Calculation()
		rotation = angle_in_Rad
	else:
		sprite.play("Actual")
		position+=move_dir
func _on_timer_timeout() -> void:
	move_dir = Vector2(cos(angle_in_Rad)*attackSpeed,sin(angle_in_Rad)*attackSpeed)
	move_Attack = true
