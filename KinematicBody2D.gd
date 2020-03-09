extends KinematicBody2D

const GRAVITY = 15
const JUMP = -250
const SPEED = 200
const FLOOR = Vector2(0, -1)

var on_ground = false

var velocity = Vector2()
var entered = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		
	else:
		velocity.x = 0 
	
	if Input.is_action_pressed("ui_up"):
		if on_ground == true:
			velocity.y = JUMP
			on_ground = false
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false
	
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity, FLOOR)
	
	
		
	if Input.is_action_pressed("ui_accept") && entered == true:
		get_node("../items").interact()


func _on_Area2D_body_entered(body):
	entered = true
			
	
