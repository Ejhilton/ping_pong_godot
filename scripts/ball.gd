extends RigidBody2D

var startForce = Vector2(-100,0)
var angleScaler = 10
var constantXSpeed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity += startForce
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var collision = move_and_collide(linear_velocity * delta)
	if collision:
		if collision.get_collider() is RigidBody2D:
			var potential_bounce = linear_velocity.bounce(collision.get_normal())
			var direction_collision_to_center = collision.get_collider().position - position
			var angle_to_center = direction_collision_to_center.angle() * angleScaler
			if collision.get_position().x > collision.get_collider().position.x:
				linear_velocity = potential_bounce.rotated(deg_to_rad(-angle_to_center))
			else:
				linear_velocity = potential_bounce.rotated(deg_to_rad(angle_to_center))
		else:
			linear_velocity = linear_velocity.bounce(collision.get_normal())
		
	if linear_velocity.x < 0:
		linear_velocity.x = -constantXSpeed
	else:
		linear_velocity.x = constantXSpeed
