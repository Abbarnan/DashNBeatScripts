extends Node2D
@export var attackSpeed : int
@export var angleBetween : float
@export var attackTime: float
@export var xdistance : int 
@export var ydistance : int
@export var distanceFromPlayer : int
var xdirection : int
var ydirection : int
@onready var singleAttack : PackedScene = preload("res://SingleAttack.tscn") 
var baseNode : Node2D
var attackTimer : Timer
var amountOfAttacks : float
var fullList = [] 
var currentTimerIteration = 0
var startAttack = false
func distanceCheck():
	for i in range(len(fullList)):
		if(len(fullList[i]) >= 1):
			if(sqrt((fullList[i][0].position.x-Global.playerPosition.x)**2 + (fullList[i][0].position.y-Global.playerPosition.y)**2) > distanceFromPlayer):
				var arraySize = len(fullList[i])
				for attack in range(arraySize):
					fullList[i][0].queue_free()
					fullList[i].pop_at(0)
func _ready() -> void:
	baseNode = $"."
	angleBetween = deg_to_rad(angleBetween)
	attackTimer = $"Timer"
	amountOfAttacks = (2*PI)/angleBetween
	attackTimer.start(attackTime)
func _process(delta: float) -> void:
	if(startAttack):
		if(currentTimerIteration == 1 && len(fullList[0])>0):
			for attack in range(len(fullList[0])):
					fullList[0][attack].position += Vector2(xdirection*attackSpeed*cos(fullList[0][attack].rotation),ydirection*attackSpeed*sin(fullList[0][attack].rotation))
		elif(currentTimerIteration > 1):
			for subset in range(len(fullList)):
				if(len(fullList[subset]) > 0):
					for attack in range(amountOfAttacks):
						fullList[subset][attack].position += Vector2(xdirection*attackSpeed*cos(fullList[subset][attack].rotation),ydirection*attackSpeed*sin(fullList[subset][attack].rotation))
						


func _on_timer_timeout() -> void:
	var angleSum = 0 
	var currentSet = []
	if(currentTimerIteration%2 == 0):
		angleSum = angleBetween/2
	currentTimerIteration+=1
	startAttack = true
	for attack in range(amountOfAttacks):
		if(angleSum >= 0 && angleSum <= (PI/2)):
			xdirection = 1
			ydirection = -1
		elif (angleSum > (PI/2) && angleSum <= PI):
			xdirection = 1
			ydirection = 1
		elif(angleSum > PI && angleSum <= ((3*PI)/2)):
			xdirection = -1
			ydirection = 1
		elif (angleSum > (3*PI/2) && angleSum< 2*PI):
			xdirection = -1
			ydirection = -1
		var tempAttack = singleAttack.instantiate()
		tempAttack.position = Vector2(cos(angleSum)*(xdistance-baseNode.position.x),sin(angleSum)*(ydistance-baseNode.position.y))
		tempAttack.rotation = angleSum
		angleSum += angleBetween
		tempAttack.name = str(currentTimerIteration)+str(attack)
		currentSet.append(tempAttack)
		add_child(tempAttack)
	fullList.append(currentSet)
