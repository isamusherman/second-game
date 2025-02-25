extends State

class_name GroundState

const JUMP_VELOCITY = -300.0
@export var air_state : State
@export var jump_animation : String = "jump"

#		if Input.is_action_just_pressed("jump") and is_on_floor():
#			velocity.y = JUMP_VELOCITY

func on_enter():
	playback.travel("idle")

func state_input(event : InputEvent):
	if(event.is_action_pressed("jump")):
		jump()


func jump():
	character.velocity.y = JUMP_VELOCITY
	next_state = air_state
	playback.travel(jump_animation)
