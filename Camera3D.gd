extends Camera3D

var mouse = Vector2()
var selected : PackedScene
var using : String

func _input(event):
	if event is InputEventMouse:
		mouse = event.position
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			get_selection(selected)

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
