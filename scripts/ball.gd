extends RigidBody2D

var startForce = Vector2(-100,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity += startForce
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var collision = move_and_collide(linear_velocity * delta)
	if collision:
		linear_velocity = linear_velocity.bounce(collision.get_normal())
