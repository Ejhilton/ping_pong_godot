extends RigidBody2D

const SPEED = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	
	var direction = Input.get_axis("move_up", "move_down")
	
	if direction:
		linear_velocity.y = direction * SPEED
	else:
		linear_velocity.y = move_toward(linear_velocity.y, 0, SPEED)
		
	move_and_collide(linear_velocity)
		
	
