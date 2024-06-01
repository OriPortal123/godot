extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var player = $"."

const SPEED = 200
const JUMP_VELOCITY = -300

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	

		
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	
	
		
		
		
	if direction > 0:
		animated_sprite.flip_h = false
	if direction < 0:
		animated_sprite.flip_h = true
	
	if Input.is_action_just_pressed("dash"):
		if direction > 0:
			player.position.x = (player.position.x + 30)
		elif direction < 0:
			player.position.x = (player.position.x - 30)
	
	
	if direction == 0:
		if is_on_floor() == true:
			animated_sprite.play("Idle")
	elif is_on_floor() == true:
		animated_sprite.play("moving")
	else:
		animated_sprite.play("jumping")
	
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
