extends RigidBody2D
@onready var trail = $"../ball_trail"


var minXForce = 100
var maxXForce = 200

var minYForce = 5
var maxYForce = 30

var startForce = Vector2(-100,0)
var angleScaler = 10
var constantXSpeed = 200
const MAX_TRAIL_POINTS = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	startForce = self.generate_random_force()
	position = global_settings.ball_start_position
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
	
	if trail:
		if trail.get_point_count() > 50:
			trail.remove_point(0)
		trail.add_point(global_position)
	print(constantXSpeed)
	
func generate_random_force():
	var randomXForce = randi() % (maxXForce - minXForce + 1) + minXForce
	var randomYForce = randi() % (maxYForce - minYForce + 1) + minYForce
	
	if randf() < 0.5:
		randomXForce = -randomXForce
	
	if randf() < 0.5:
		randomYForce = -randomXForce
	
	return Vector2(randomXForce, randomYForce)
	


func _on_timer_timeout():
	constantXSpeed += 10
