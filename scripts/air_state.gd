extends State

class_name AirState

@export var ground_state : State
var falling : bool = false

func on_enter():
	falling = false

func state_process(delta):
	if(character.velocity.y > 0 && !falling):
		playback.travel("jump_lane_tween")
		falling = true
	if(character.is_on_floor()):
		next_state = ground_state
