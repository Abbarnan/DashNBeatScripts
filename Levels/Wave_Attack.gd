extends Node2D
var maxHeight : Node2D
var minHeight : Node2D
var waveItems : Array
var timer : Timer
var waveBegin = false
var waveDone = false
var waveItemHeightReached : Array
@export var waveStartTime : float
@export var attackSpeed : int
var currentItem = 0
var arrayLen : int
func _ready() -> void:
	maxHeight = $"Top Spot"
	minHeight = $"Bottem Spot"
	waveItems = $".".find_children("*","CharacterBody2D")
	timer = $"Timer"
	arrayLen = len(waveItems)-1
	for item in range(len(waveItems)):
		waveItemHeightReached.append(0)
	timer.start(waveStartTime)
func _process(delta: float) -> void:
	if(waveBegin):
		if  (waveItems[currentItem].position.y > maxHeight.position.y):
			waveItems[currentItem].position -= Vector2(0,attackSpeed)
		if(currentItem != arrayLen && waveItems[currentItem].position.y <= maxHeight.position.y):
			currentItem += 1
		elif(currentItem == arrayLen && waveItems[currentItem].position.y <= maxHeight.position.y):
			currentItem = 0
			waveDone = true
			waveBegin = false
	if(waveDone):
		if  (waveItems[currentItem].position.y < minHeight.position.y):
			waveItems[currentItem].position += Vector2(0,attackSpeed)
		if(currentItem != arrayLen && waveItems[currentItem].position.y >= minHeight.position.y):
			currentItem += 1
		elif(currentItem == arrayLen && waveItems[currentItem].position.y >= minHeight.position.y):
			waveDone = false
func _on_timer_timeout() -> void:
	waveBegin = true
