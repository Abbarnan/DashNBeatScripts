extends Node2D
var timer : Timer
var topSprite : AnimatedSprite2D
var bottomSprite : AnimatedSprite2D
var topWall : CharacterBody2D
var bottomWall : CharacterBody2D
var moveAttack = false
var topStartingY : int
var bottomStartingY : int
@export var attackSpeed : int
@export var waitTime : int
@export var travelDistances : int
@export var repeat : bool

func _ready() -> void:
	topSprite = $"Top Wall/AnimatedSprite2D"
	bottomSprite = $"Bottom Wall/AnimatedSprite2D"
	topWall = $"Top Wall"
	bottomWall = $"Bottom Wall"
	topStartingY = topWall.position.y
	bottomStartingY = bottomWall.position.y
	timer = $Timer
	timer.one_shot = repeat
	timer.start(waitTime)
	
func _process(delta: float) -> void:
	if moveAttack:
		bottomWall.position.y -= attackSpeed
		topWall.position.y += attackSpeed
		if abs(bottomWall.position.y - bottomStartingY) > travelDistances:
			moveAttack = false
	if(!moveAttack and bottomWall.position.y != bottomStartingY):
		bottomWall.position.y += attackSpeed
		topWall.position.y -= attackSpeed
func _on_timer_timeout() -> void:
	moveAttack = true
	bottomSprite.play("Actual")
	topSprite.play("Actual")
