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
@export var repeat : bool

func _ready() -> void:
	rightSprite = $"Right Wall/AnimatedSprite2D"
	leftSprite = $"Left Wall/AnimatedSprite2D"
	rightWall = $"Right Wall"
	leftWall = $"Left Wall"
	rightStartingX = rightWall.position.x
	leftStartingX = leftWall.position.x
	timer = $Timer
	timer.one_shot = repeat
	timer.start(waitTime)
	
func _process(delta: float) -> void:
	if moveAttack:
		leftWall.position.x += attackSpeed
		rightWall.position.x -= attackSpeed
		if abs(leftWall.position.x - leftStartingX) > travelDistances:
			moveAttack = false
	if(!moveAttack and leftWall.position.x != leftStartingX):
		leftWall.position.x -= attackSpeed
		rightWall.position.x += attackSpeed
func _on_timer_timeout() -> void:
	moveAttack = true
	leftSprite.play("Actual")
	rightSprite.play("Actual")
