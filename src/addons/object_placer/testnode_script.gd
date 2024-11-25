@tool
extends Node3D
@onready var test_cube:PackedScene = preload("objects/the_cube.tscn")
#"res://addons/testplugin/objects/the_cube.tscn"
@onready var marker: MeshInstance3D = MeshInstance3D.new()
@onready var ray_cast = RayCast3D.new()
@onready var new_click_location: Vector2 = Vector2.INF
@onready var new_intersection_result_dict:Dictionary={}
@onready var is_dirty=false
@onready var editor_cameras: Array[Camera3D]
@onready var editor_2dvp: SubViewport
@onready var camera=Camera3D
#
#if Engine.is_editor_hint():
		#editor_2dvp = EditorInterface.get_editor_viewport_2d()
#
		#for i in 4:
			#var vp = EditorInterface.get_editor_viewport_3d(i)
			#var cam = vp.get_camera_3d()
			#editor_cameras.push_back(cam)


#
#func _input(camera: Camera3D, event: InputEvent)->void:
	#if event is InputEventMouseMotion:
		#if Engine.is_editor_hint():
			#new_click_location = event.position
			##for debugging
			##print('this is the new_click_location:',new_click_location)
			##var mouse_position=get_viewport().get_mouse_position()
			##print('this is the mouse_position:', mouse_position)
			#
			#doTheRaycast(camera)
		##print("Forward 3d GUI. in mouse motion Mouse buttons: %d, pos: %.1v, global_pos: %.1v" % [ event.button_mask, event.position, event.global_position ])
		#pass
	#if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		#print('mouse pressed')
		#pass

		
	




#"res://addons/testplugin/test_cube.tscn"
# Called when the node enters the scene tree for the first time.
#func _ready():
	##var the_cube_=the_cube_.instantiate()
	##add_child(the_cube)
	#pass # Replace with function body.

func _enter_tree():
	#if Engine.is_editor_hint():
	var test_cube= test_cube.instantiate()
	add_child(test_cube)
	#test_cube.set_owner(get_tree().get_edited_sceen_root())
	test_cube.owner=get_tree().edited_scene_root
	print(test_cube.name)
	#the_cube_.set_owner(self)
		#Tree=get_tree()
		#Tree.root
	var root = get_tree().get_root().get_child(0)
	print(root.name)
		#the_cube.set_owner(get_tree().get_edited_sceen_root())
		#the_cube.set_owner(root)
		
	print('the node just entered the tree')
	
	## `parent` could be any node in the scene.
	#var node = Node3D.new()
	#add_child(node) # Parent could be any node in the scene
#
	## The line below is required to make the node visible in the Scene tree dock
	## and persist changes made by the tool script to the saved scene file.
	#node.owner = get_tree().edited_scene_root
	#
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print('Im am the custom node')
	pass

#func _enter_tree():
	#root = get_tree().get_root().get_child(0)
	#return root





func _handles(obj) -> bool:
	return true
#func _enter_tree():
	# Initialization of the plugin goes here.
	#add_child(marker)
	#add_custom_type("testnode", "Node3D", preload("testnode_script.gd"),preload("Icons/icon_terrain3d.svg"))
	
#	pass
	
#func _exit_tree():
	#remove_custom_type("testnode")
	# Clean-up of the plugin goes here.
#	pass
	
func _ready() -> void:
	
	if Engine.is_editor_hint():
		#editor_2dvp = EditorInterface.get_editor_viewport_2d()
		#var vp = EditorInterface.get_editor_viewport_3d()
		camera = EditorInterface.get_editor_viewport_3d().get_camera_3d()
		#for i in 4:
			##var vp = EditorInterface.get_editor_viewport_3d(i)
			#var cam = vp.get_camera_3d()
			#editor_cameras.push_back(cam)

	#('print Init geht _ready')
	ray_cast.hide()
	ray_cast.set_collision_mask_value(1, true)
	
	add_child(ray_cast)

	marker.mesh = BoxMesh.new()
	marker.scale = Vector3(0.2, 1, 0.2)
	marker.hide()
	add_child(marker)
		#test_cube.set_owner(get_tree().get_edited_sceen_root())
	marker.owner=get_tree().edited_scene_root
	#var the_cube =the_cube.instantiate()
#
#func _input(event):
   ## Mouse in viewport coordinates.
	#if event is InputEventMouseButton:
		#print("Mouse Click/Unclick at: ", event.position)
	#elif event is InputEventMouseMotion:
		#print("Mouse Motion at: ", event.position)
#
   ## Print the size of the viewport.
	#print("Viewport Resolution is: ", get_viewport().get_visible_rect().size)
#
##func _input(camera: Camera3D, event: InputEvent) -> int:
	##if event is InputEventMouseMotion:
		##if Engine.is_editor_hint():
			##new_click_location = event.position
			###for debugging
			##print('this is the new_click_location:',new_click_location)
			###var mouse_position=get_viewport().get_mouse_position()
			###rint('this is the mouse_position:', mouse_position)
			##
			##doTheRaycast(camera)
		###print("Forward 3d GUI. in mouse motion Mouse buttons: %d, pos: %.1v, global_pos: %.1v" % [ event.button_mask, event.position, event.global_position ])
		##pass
	##if event is InputEventMouseButton and event.pressed and event.button_index == 1:
	###if event is InputEventMouseButton :
		###var camera = viewport_camera
		##print("Forward 3d GUI. Mouse buttons: %d, pos: %.1v, global_pos: %.1v" % [ event.button_mask, event.position, event.global_position ])
		##add_child_to_collision_object(new_intersection_result_dict)
		###new_click_location = event.position
		###print("New click location at forward 3d gui input")
		###var from = camera.project_ray_origin(event.position)
		###var to = from + camera.project_ray_normal(event.position) * 100
		###var cursorPos = Plane(Vector3.UP, event.origin.y).intersects_ray(from, to)
		###var cursorPos = camera.get_world_3d().direct_space_state.intersect_ray(PhysicsRayQueryParameters3D.create(from, to))
		###print('this is from:',from)
		###print ('this is to:',to)
		###print('this is intersect ray result:',cursorPos)
		###doTheRaycast(camera)
		##
		##
	##return EditorPlugin.AFTER_GUI_INPUT_PASS



func _physics_process(_delta):
	# if is_dirty==false:
	# 	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
	# 		is_dirty=true
	# 		#new_click_location = event.position
	# 		print('you pressed the left mouse button')
	# if is_dirty==true:
	# 	#do stuff
	# 	doTheRaycast(camera)
	# 	is_dirty=false
	
	
	pass
	

func doTheRaycast(camera: Camera3D):
	if Engine.is_editor_hint():
		print("doing raycast")
		var from: Vector3 = camera.project_ray_origin(new_click_location)
		#var from: Vector3 = _editor_viewport_camera.project_ray_origin(new_click_location)
		#var to = from + camera.project_ray_normal(event.position) * 100
		#var to: Vector3 = camera.project_ray_normal(new_click_location) * 1000
		var to: Vector3 = from+camera.project_ray_normal(new_click_location) * 1000
		#var to: Vector3 = _editor_viewport_camera.project_ray_normal(new_click_location) * 1000
		
		var result_position: Vector3 = Vector3.INF
		
		#if _use_space_state:
		#var space_state: PhysicsDirectSpaceState3D = get_world_3d().direct_space_state
		var result: Dictionary = camera.get_world_3d().direct_space_state.intersect_ray(PhysicsRayQueryParameters3D.create(from, to))
		print('this is from:',from)
		print ('this is to:',to)
		print('this is intersect ray result:',result)
		if result != null and  result.is_empty()==false:
			result_position = result["position"]
			new_intersection_result_dict=result
				#player.update_path(a_star_custom.find_path(player.global_transform.origin, result_position))
			print("result gefunden")
		else:
			print('kein Result gefunden.')
			ray_cast.global_position = from
			ray_cast.target_position = to
			ray_cast.force_raycast_update()
			
			if not ray_cast.visible:
				ray_cast.show()
				
			result_position = ray_cast.get_collision_point() 
			print('kein Result gefunden.')
		if result_position == Vector3.INF:
			marker.hide()
		else:
			var col_nor = result.normal
			print(col_nor)
			var col_point = result_position
			
			marker.show()
			marker.global_transform.origin = col_point
			marker.transform=align_with_normal(marker.transform,col_nor)
	new_click_location = Vector2.INF

func align_with_normal(xform: Transform3D, n2: Vector3) -> Transform3D:
	var n1 = xform.basis.y.normalized()
	var cosa = n1.dot(n2)
	if cosa >= 0.99:
		return xform
	var alpha = acos(cosa)
	var axis = n1.cross(n2).normalized()
	if axis == Vector3.ZERO:
		axis = Vector3.FORWARD # normals are in opposite directions
	return xform.rotated(axis, alpha)

func add_child_to_collision_object(collision_result:Dictionary):
	if collision_result != null and  collision_result.is_empty()==false: 
		var collision_object:Node3D= collision_result.collider #collision_result.collider #collision_result.collider
		var collision_point:Vector3 = collision_result.position  # Kollisionspunkt des Raycasts
		var collision_normal:Vector3 = collision_result.normal # Kollisionspunkt des Raycasts
		#var instanciated_object:Node3D = the_cube.instantiate()
		#instanciated_object.position=collision_point
		##var parent = get_scene().get_node("Parent")
		#add_child(instanciated_object)
		#instanciated_object.owner=get_tree().edited_scene_root
		##instanciated_object.global_transform.origin=collision_point
		#
		#instanciated_object.transform=align_with_normal(instanciated_object.transform,collision_normal)
		#
		# var test_cube= test_cube.instantiate()
		# test_cube.position = collision_point
		# add_child(test_cube)
		# #test_cube.set_owner(get_tree().get_edited_sceen_root())
		# test_cube.owner=get_tree().edited_scene_root
		# print(test_cube.name)
