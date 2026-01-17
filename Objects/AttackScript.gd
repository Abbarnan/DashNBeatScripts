extends CharacterBody2D
var player : CharacterBody2D
var angle_in_Rad : float
var rotation_direction : int
var sprite = AnimatedSprite2D
var timer = Timer
func _ready() -> void:
	player = $"../Character"
	sprite = $AnimatedSprite2D
	timer = $Timer
	sprite.play("Actual") 
	timer.start
func degrees_Calculation():
	angle_in_Rad = atan2(player.position.y - position.y, player.position.x - position.x)
func _process(delta: float) -> void:
	if timer.wait_time:
		degrees_Calculation()
		rotation = angle_in_Rad
	else:
		sprite.play("Projection")
		position += Vector2(0.1,0.1)
