extends Node2D
var timer : Timer
var rightSprite : AnimatedSprite2D
var leftSprite : AnimatedSprite2D
var rightWall : CharacterBody2D
var leftWall : CharacterBody2D
var moveAttack = false
var rightStartingX : int
var leftStartingX : int
@export var attackSpeed : int
@export var waitTime : int
@export var travelDistances : int

func _ready() -> void:
	rightSprite = $"Right Wall/AnimatedSprite2D"
	leftSprite = $"Left Wall/AnimatedSprite2D"
	rightWall = $"Right Wall"
	leftWall = $"Left Wall"
	rightStartingX = rightWall.position.x
	leftStartingX = leftWall.position.x
	timer = $Timer
	timer.start(waitTime)
	
func _process(delta: float) -> void:
	if moveAttack:
		leftWall.position.y += attackSpeed
		rightWall.position.y -= attackSpeed
		if abs(leftWall.position.y - leftStartingX) > travelDistances and abs(rightWall.position.y - rightStartingX) > travelDistances:
			moveAttack = false
	if(!moveAttack and leftWall.position.y != leftStartingX):
		leftWall.position.y -= attackSpeed
		rightWall.position.y += attackSpeed
func _on_timer_timeout() -> void:
	moveAttack = true
	leftSprite.play("Actual")
	rightSprite.play("Actual")
