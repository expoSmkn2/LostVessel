extends CharacterBody2D
class_name controller

@onready var sprite = $animator/Sprite2D
@export var speed = 10.0
@export var jump_power = 10.0

var speed_multiplier = 30.0
var jump_multiplier = -30.0
var direction = 0

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") 

func _physics_process(delta):
	# Add the gravity.
	if Input.is_action_pressed("ml"):
		sprite.scale.x = abs(sprite.scale.x) * -1
	if Input.is_action_pressed("mr"):
		sprite.scale.x = abs(sprite.scale.x)
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jp") and is_on_floor():
		velocity.y = jump_power * jump_multiplier

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ml", "mr")
	if direction:
		velocity.x = direction * speed * speed_multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)

	move_and_slide()
