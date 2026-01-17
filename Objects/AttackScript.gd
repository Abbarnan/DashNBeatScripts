extends CharacterBody2D
var player : CharacterBody2D
var angle_in_deg : float
var rotation_direction : int

func _ready() -> void:
	player = $"../Character"
func degrees_Calculation():
	angle_in_deg = atan2(player.position.y - position.y, player.position.x - position.x)
	print("Angle in degrees: ", angle_in_deg)
'''
func positioning():
	var rotation_direction : int
	if angle_radians < 0:
		rotation_direction = -1
	else:
		rotation_direction = 1
	if angle_radians > 0.5:
		rotate(0.1 * rotation_direction)
	else:
		rotate(0.1 * rotation_direction)
'''
func _process(delta: float) -> void:
	degrees_Calculation()
	if angle_in_deg > 0:
		rotation = 0.1
	elif angle_in_deg < 0:
		rotation = -0.1
	else:
		rotation = 0
