extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -300.0

var is_alive: bool = true

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_tree: AnimationTree = $AnimationTree

	
func _ready() -> void:
	animation_tree.active = true

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_alive:
		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("move_left", "move_right")
		
			
		#This Applies Movement
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
		animate(direction)
	
func animate(direction):	
	animation_tree.set("parameters/idle/blend_position", direction)
	
	#Flip Sprite
	if direction > 0:
		sprite.flip_h = false
	elif direction < 0:
		sprite.flip_h = true
