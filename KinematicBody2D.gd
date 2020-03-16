extends KinematicBody2D

onready var get_item = get_node("../item_class")

const GRAVITY = 15
const JUMP = -250
const FLOOR = Vector2(0, -1)

var SPEED = 200
var on_ground = false

var velocity = Vector2()
var entered_key = false
var entered_door = false

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
	
	
		
	if Input.is_action_just_pressed("ui_accept") && entered_key == true:
		get_node("../items/item1").interact()
	
	if Input.is_action_just_pressed("ui_accept") && entered_door == true:
		get_node("../items/door").interact()


func _on_Area2D_body_entered(body):
	entered_key = true
		
func _on_Area2D_body_exited(body):
	entered_key = false


func _on_door_body_entered(body):
	entered_door = true
		
func _on_door_body_exited(body):
	entered_door = false
