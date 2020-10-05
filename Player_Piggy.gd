extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

var movement: Vector2 = Vector2(0, 0)

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
	if Input.is_action_pressed('ui_accept'):
		attack()
		
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	handleanimation(delta)
	velocity = move_and_slide(velocity)
	handlefootsteps()
	
func handlefootsteps():
	if velocity.x > 0:
		if not $"Footsteps".playing:
			$"Footsteps".play()
	if velocity.x < 0:
		if not $"Footsteps".playing:
			$"Footsteps".play()
	if velocity.y > 0:
		if not $"Footsteps".playing:
			$"Footsteps".play()
	if velocity.y < 0:
		if not $"Footsteps".playing:
			$"Footsteps".play()
			
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


var MOVE_SPEED: float = 5
var THE_WORLD_TILEMAP: String = "Enemy TileMap"

	
func attack():
	if not $"../SickleSwing".playing:
		$"../SickleSwing".play()
	$AnimationPlayer.play("Attack_Down")

