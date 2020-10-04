extends Node2D

var MOVE_SPEED: float = 5
var THE_WORLD_TILEMAP: String = "Enemy TileMap"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var movement: Vector2 = Vector2(0, 0)

func move(velocity):
	self.transform.origin += velocity
	
func attack():
	if not $SickleSwing.playing:
		$SickleSwing.play()
	
func _process(delta):

	self.movement = Vector2(0, 0)

	if (Input.is_action_pressed("ui_up")):
		self.movement.y -= MOVE_SPEED
	if (Input.is_action_pressed("ui_down")):
		self.movement.y += MOVE_SPEED
	if (Input.is_action_pressed("ui_left")):
		self.movement.x -= MOVE_SPEED
	if (Input.is_action_pressed("ui_right")):
		self.movement.x += MOVE_SPEED
	if (Input.is_key_pressed(KEY_ESCAPE)):
		get_tree().quit()

	if (Input.is_action_pressed("ui_accept")):
		self.attack()
		
	return delta
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#func _on_Hitbox_body_entered(body):
#	if (body.name == THE_WORLD_TILEMAP):
#		print(self.movement)
#		self.transform.origin -= self.movement
