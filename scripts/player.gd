extends CharacterBody2D


const SPEED = 150.0




@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var state_machine: CharacterStateMachine = $CharacterStateMachine

	
func _ready() -> void:
	animation_tree.active = true

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	if state_machine.check_can_move():
		# Get the input direction and handle the movement/deceleration.
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
