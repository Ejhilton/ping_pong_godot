extends RigidBody2D
@onready var game_manager = %GameManager
@onready var p_1_point_zone = $"../p1_point_zone"
@onready var p_2_point_zone = $"../p2_point_zone"

var startForce = Vector2(-100,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect the area_entered and area_exited signals
	connect("area_entered", Callable(self, "_on_area_entered"))
	# Assuming you have two Area2D nodes named "area_1" and "area_2"
	# Connect their respective signals to your handler functions
	p_1_point_zone.connect("body_entered", Callable(self, "_on_area_entered"))
	p_2_point_zone.connect("body_entered", Callable(self, "_on_area_entered"))
	linear_velocity += startForce
	
func _on_area_entered(area: Area2D):
	# This function is called whenever the ball enters any Area2D
	if area == p_1_point_zone:
		game_manager.add_point(1)
	else:
		game_manager.add_point(2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var collision = move_and_collide(linear_velocity * delta)
	if collision:
		linear_velocity = linear_velocity.bounce(collision.get_normal())
