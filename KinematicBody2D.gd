extends KinematicBody2D

onready var get_item = get_node("../item_class")

const GRAVITY = 10
const JUMP = -250
const FLOOR = Vector2(0, -1)

var hp = 200
var cooldown = false
var DASH = 1
var SPEED = 200
var on_ground = false
var dashed = true
var velocity = Vector2()
var entered_key = false
var entered_door = false
var entered_sword = false
var Dduration = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if get_item.items["3"]["is_picked"] == true:
		if Input.is_action_just_pressed("block"):
			#block
			pass

	if get_item.items["3"]["is_picked"] == true:
		if Input.is_action_pressed("slash"):
			#vanlig attack
			pass
			
	if get_item.items["3"]["is_picked"] == true:	
		if Input.is_action_just_pressed("dash"):
			if cooldown == true:
				DASH = 3
				cooldown = false
			else:
				DASH = 1
				cooldown = false

	if Input.is_action_pressed("ui_right"):
		if Dduration == true:
			DASH = 1
			velocity.x = SPEED * DASH
		else:
			velocity.x = SPEED * DASH
			
		if get_item.items["3"]["is_picked"] == true:
			$CollisionShape2D/Sprite.flip_h = false
			$CollisionShape2D/Sprite.play("walking_with_sword_R")
		else:
			$CollisionShape2D/Sprite.flip_h = true
			$CollisionShape2D/Sprite.play("walking")
		

	elif Input.is_action_pressed("ui_left"):
		if Dduration == true:
			DASH = 1
			velocity.x = -SPEED * DASH
		else:
			velocity.x = -SPEED * DASH
		if get_item.items["3"]["is_picked"] == true:
			$CollisionShape2D/Sprite.flip_h = false
			$CollisionShape2D/Sprite.play("walking_with_sword_L")
		else:
			$CollisionShape2D/Sprite.flip_h = false
			$CollisionShape2D/Sprite.play("walking")

	else:
		velocity.x = 0 
		if get_item.items["3"]["is_picked"] == true:
			$CollisionShape2D/Sprite.play("default_with_sword")
		else:
			$CollisionShape2D/Sprite.play("default")

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
		
	if Input.is_action_just_pressed("ui_accept") && entered_sword == true:
		get_node("../items/sword").interact()

func _on_Area2D_body_entered(body):
	entered_key = true
func _on_Area2D_body_exited(body):
	entered_key = false

func _on_door_body_entered(body):
	entered_door = true
func _on_door_body_exited(body):
	entered_door = false

func _on_sword_body_entered(body):
	entered_sword = true
func _on_sword_body_exited(body):
	entered_sword = false

func _on_Timer_timeout():
	print("y")
	cooldown = true
func _on_dash_duration_timeout():
	print("x")
	Dduration = false
