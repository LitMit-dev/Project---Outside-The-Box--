extends CharacterBody2D


const SPEED = 300.0
const jump_speed = -405.0
var jumpAvailible = true

func jump():
	velocity.y = jump_speed
	jumpAvailible = false

func CoyoteEnd():
	jumpAvailible = false

func _physics_process(delta):
	if velocity.y <= 0 and !jumpAvailible and is_on_floor():
		jumpAvailible = true

	velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and jumpAvailible:
		jump()
		
	if (!is_on_floor()) and jumpAvailible and $CoyoteTimer.is_stopped():
		$CoyoteTimer.start()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		$Rat_Sprite.flip_h = velocity.x > 0
		if is_on_floor_only():
			$Rat_Anims.play("run")
		else: 
			$Rat_Anims.play("idle") #placeholder for jumpanim
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor_only():
			$Rat_Anims.play("idle")

	move_and_slide()
