extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var die_time = 0.0
var die = false;

var duration = 2
var idx=0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if die:
		die_time += delta
		$Sphere.get_surface_material(0).set_shader_param("time", die_time*(PI/duration))
		var img = get_viewport().get_texture().get_data()
		var capture_name = "capture0"+str(idx)+".png"
		if idx < 10:
			capture_name = "capture00"+str(idx)+".png"
		img.save_png(capture_name)
		idx+=1
		if die_time>=duration:
			deactivate_die()

func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton and event.pressed:
		print("Mouse Click: ", event.position)
		activate_die()
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_SPACE:
			var img = get_viewport().get_texture().get_data()
			img.save_png("capture.png")
		

func activate_die():
	die = true
	die_time = 0.0
	idx = 0
	$Sphere.get_surface_material(0).set_shader_param("die", die)
	
func deactivate_die():
	die = false
	
	
