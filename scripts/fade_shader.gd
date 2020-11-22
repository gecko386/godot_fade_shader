extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var die_time = 0.0
var die = false;

var duration = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if die:
		die_time += delta
		$Sphere.get_surface_material(0).set_shader_param("time", die_time*(PI/duration))
		if die_time>=duration:
			deactivate_die()

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton and event.pressed:
		activate_die()

func activate_die():
	die = true
	die_time = 0.0
	$Sphere.get_surface_material(0).set_shader_param("die", die)
	
func deactivate_die():
	die = false
	
	
