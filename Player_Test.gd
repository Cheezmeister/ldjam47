extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	handleanimation(delta)
	velocity = move_and_slide(velocity)
	
func handleanimation(delta):
	print("blah")
	if velocity.x < 0:
		$AnimationPlayer.play('Walk_Left')
	elif velocity.x > 0:
		$AnimationPlayer.play('Walk_Right')
	elif velocity.y < 0:
		$AnimationPlayer.play('Walk_Up')
	elif velocity.y > 0:
		$AnimationPlayer.play('Walk_Down')
	else:
		$AnimationPlayer.play('Idle')
		
