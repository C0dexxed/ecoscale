extends Camera3D

var mouse = Vector2()
var cube = preload("res://grass_cube.tscn")
var water = preload("res://water_cube.tscn")
func _input(event):
	if event is InputEventMouse:
		mouse = event.position
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			get_selection(cube)
		if event.button_index == MOUSE_BUTTON_RIGHT:
			get_selection(water)

func get_selection(prefab):
	var worldspace = get_world_3d().direct_space_state
	var start = project_ray_origin(mouse)
	var end = project_position(mouse, 1000)
	var result = worldspace.intersect_ray(PhysicsRayQueryParameters3D.create(start, end))
	result = result["collider"] #Can access nodes off of this
	if not result.builtOn:
		result.builtOn = true
		var newCube = prefab.instantiate()
		newCube.global_position = result.get_node("Marker3D").global_position
		get_tree().current_scene.add_child(newCube)
	else:
		print("Can't build here!")
