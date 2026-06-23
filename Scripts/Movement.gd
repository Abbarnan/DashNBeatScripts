extends CharacterBody2D
@export var currentSpeed : int
@export var dashVelocity : int
@export var dashTime : float
@export var dashWaitTime : float
var timer : Timer
var is_sprinting: bool = false
var canDash = true
var animated_sprite: AnimatedSprite2D
var battling = false
var alive = true
var isDashing = false
func _ready():
	timer = $"Dash Timer"
	animated_sprite = $AnimatedSprite2D
	Global.playerPosition = $".".position
func get_input():
	var inputDir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if !isDashing:
		velocity = inputDir * currentSpeed
	else:
		velocity = inputDir * dashVelocity
func _physics_process(delta):
	get_input()
	if Input.is_action_just_pressed("Dashing") and canDash:
		isDashing = true
	if(!isDashing):
		move_and_collide(velocity * delta)
	else:
		move_and_collide(velocity * dashTime)
		isDashing = false
		canDash = false
		timer.start(dashWaitTime)
	Global.playerPosition = position
func _on_area_2d_area_entered(area: Area2D) -> void:
	print("Hit")
	if area.is_in_group("Attack"):
		alive = false
func _on_dash_timer_timeout() -> void:
	canDash = true
