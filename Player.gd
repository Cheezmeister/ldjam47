extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Hooray")
	pass # Replace with function body.



var count: int = 0

func _process(delta):

	if (Input.is_action_pressed("ui_up")):
		self.transform.origin.y -= 1
	if (Input.is_action_pressed("ui_down")):
		self.transform.origin.y += 1
	if (Input.is_action_pressed("ui_left")):
		self.transform.origin.x -= 1
	if (Input.is_action_pressed("ui_right")):
		self.transform.origin.x += 1
	if (Input.is_key_pressed(KEY_ESCAPE)):
		get_tree().quit()
	return delta
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass