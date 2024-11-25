@tool
extends EditorPlugin
@onready var marker_replacer: MeshInstance3D = MeshInstance3D.new()
@onready var marker_tscn:PackedScene
@onready var marker_node_3d:Node3D
@onready var ray_cast = RayCast3D.new()
@onready var new_click_location: Vector2 = Vector2.INF
@onready var new_intersection_result_dict:Dictionary={}
@onready var is_mouse_pressed=false
##var editorAddon=preload("res://addons/testplugin/objectPlacer.tscn")
#var dockedScene
@onready var list_of_Resources:ItemList
@onready var directoryPath = "res://assets/designs/UTM Fantasy/"
@onready var extension_tscn = "tscn"
@onready var extension_blend= "blend"
@onready var sceens_tscn=[]
var enteredTree=false
@onready var last_selected_index:int
@onready var do_we_have_scenes_available=true
@onready var process_mouse_wheel_event=false #helper to prevent catching too many mouse wheel events


func getFilePathsByExtension(directoryPath: String, extension: String, recursive: bool = true) -> Array:
	var filePaths := []
	var dir = DirAccess.open(directoryPath)
	if dir:
		#print(dir.get_drive_name())
	#if dir.open(directoryPath) != OK:
		#printerr("Warning: could not open directory: ", directoryPath)
		#return []
	#
	#if dir.list_dir_begin(true, true) != OK:
		#printerr("Warning: could not list contents of: ", directoryPath)
		#return []

		dir.list_dir_begin()

		var fileName :String = dir.get_next()
		print( 'das ist der filename ',fileName)

		while fileName != "":
			if dir.current_is_dir():
				if recursive:
					var dirPath = dir.get_current_dir() + "/" + fileName
					filePaths += getFilePathsByExtension(dirPath, extension, recursive)
			else:
				if fileName.get_extension() == extension:
					var filePath = dir.get_current_dir() + "/" + fileName
					var objectName=fileName.get_slice(extension,0) 
					print("das sollte nur der name sein ",objectName )
					filePaths.append(filePath)
		
			fileName = dir.get_next()
			print('das ist der filename ',fileName)
	else:
		print('no dir ')
	return filePaths

func preload_sceens(directoryPath: String, extension: String, recursive: bool = true) -> Array:
	var sceens_tscn := []
	var dir = DirAccess.open(directoryPath)
	if dir:
		dir.list_dir_begin()
		var fileName :StringName = dir.get_next()
		#print( 'das ist der filename ',fileName)
		while fileName != "":
			if dir.current_is_dir():
				if recursive:
					var dirPath = dir.get_current_dir() + "/" + fileName
					sceens_tscn += preload_sceens(dirPath, extension, recursive)
			else:
				if fileName.get_extension() == extension:
					var filePath:String = dir.get_current_dir() + "/" + fileName
					print(filePath)
					var scene_tscn=load(filePath) 
					
					#var scene=preload(name)
					sceens_tscn.append(scene_tscn)
			fileName = dir.get_next()
	else:
		print('no dir ')
	return sceens_tscn

func turn_off_collider(in_node):
	var Child_nodes_list=[]
	Child_nodes_list= get_all_children(in_node,Child_nodes_list)
	for child in Child_nodes_list:
		if child is CollisionShape3D:
			child.disabled=true
		
   #disabling area2d code

func get_all_children(in_node,arr=[]):
	arr.push_back(in_node)
	for child in in_node.get_children():
		if child.get_child_count()>0:
			arr.append(get_all_children(child,arr)) 
		arr.append(child)	
	return arr

func _handles(obj) -> bool:
		return true
func _enter_tree():
	enteredTree=true
	pass
	
func _exit_tree():
	# Clean-up of the plugin goes here.
	pass
	
func _ready() -> void:

	if enteredTree==true:
		
		enteredTree=false
		var sceens_blend=preload_sceens(directoryPath,extension_blend)		
		sceens_tscn =preload_sceens(directoryPath, extension_tscn)
		if len(sceens_blend)>0:
			sceens_tscn.append_array(sceens_blend)
		
		print(sceens_tscn)
		ray_cast.set_collision_mask_value(1, true)
		add_child(ray_cast)
		if len(sceens_tscn)<1:
			do_we_have_scenes_available=false
			#create a shape
			print("Creating sphere as marker because there was no scene found in the plugin/object folder")
			marker_replacer.mesh =BoxMesh.new()
			marker_node_3d=marker_replacer
		else:
			marker_tscn=sceens_tscn[0]
			last_selected_index=0
			marker_node_3d=marker_tscn.instantiate()
			turn_off_collider(marker_node_3d)
		
		add_child(marker_node_3d)
		marker_node_3d.hide()
		print('on ready geht')
		## The line below is required to make the node visible in the Scene tree dock
		## and persist changes made by the tool script to the saved scene file.
		#node.owner = get_tree().edited_scene_root

func _forward_3d_gui_input(camera: Camera3D, event: InputEvent) -> int:
	if Engine.is_editor_hint():
		if event is InputEventMouseMotion:
			#camera.size
			new_click_location = event.position
			#print(new_click_location)

			doTheRaycast(camera)
			##if new_click_location != Vector2.INF:
			if is_mouse_pressed:
				await add_child_to_collision_object(new_intersection_result_dict)
			##print("Forward 3d GUI. in mouse motion Mouse buttons: %d, pos: %.1v, global_pos: %.1v" % [ event.button_mask, event.position, event.global_position ])
			pass
		if event is InputEventMouseButton and event.is_pressed() and event.button_index == 1:
			is_mouse_pressed=true
			await add_child_to_collision_object(new_intersection_result_dict)
		if event is InputEventMouseButton and event.is_released() and event.button_index == 1:
			is_mouse_pressed=false
			print('maus released')
			pass
		#mouse wheel up with right mouse button pressed
		if event is InputEventMouseButton and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)==false and event.button_index == 4 and Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT): #● MOUSE_BUTTON_WHEEL_UP = 4
			
			print('mouse wheel up')
			if process_mouse_wheel_event==false:
				run_timer()
				select_scene_up()
				
			else:
				print('skipped one mouse wheel up event because of process_mouse_wheel_event =true')

		if event is InputEventMouseButton and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)==false and event.button_index == 5 and Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):#● MOUSE_BUTTON_WHEEL_DOWN = 5 ● MOUSE_BUTTON_RIGHT = 2
			#is_mouse_pressed=false
			if process_mouse_wheel_event==false:
				run_timer()
				select_scene_down()
				print('mouse wheel down')
			else:
				print('skipped one mouse wheel down event because of process_mouse_wheel_event =true')

			pass

			
			
	return EditorPlugin.AFTER_GUI_INPUT_PASS

func run_timer():
	# This method is called when the timer times out
	print('running timer')
	if process_mouse_wheel_event==false:
		process_mouse_wheel_event=true
		await get_tree().create_timer(0.05).timeout
		print('stopping timer')
		process_mouse_wheel_event=false
		print("Mouse wheel up event has been triggered, do something here")

func _physics_process(_delta):
	pass
func select_scene_up():
	
	var new_index:int=-1
	#Checking if we are at the end of the list (array)
	if last_selected_index==len(sceens_tscn)-1:
		new_index=0
	else :
		new_index=last_selected_index+1	

	#Creating the new marker
	if new_index !=-1:
		var temp_position=marker_node_3d.position
		var temp_rotation=marker_node_3d.rotation
		
		if is_instance_valid(marker_node_3d):
			marker_node_3d.queue_free()
			#print('bis hier')
		
		marker_tscn=sceens_tscn[new_index]
		marker_node_3d=marker_tscn.instantiate()
		turn_off_collider(marker_node_3d)
		add_child(marker_node_3d)
		marker_node_3d.position=temp_position
		marker_node_3d.rotation =temp_rotation
		last_selected_index=new_index
		print('new index: ',last_selected_index)
		
func select_scene_down():
	
	var new_index:int=-1
	#Checking if we are at the end of the list (array)
	if last_selected_index==0:
		new_index=len(sceens_tscn)-1
	else :
		new_index=last_selected_index-1	

	#Creating the new marker
	if new_index !=-1:
		var temp_position=marker_node_3d.position
		var temp_rotation=marker_node_3d.rotation
		
		if is_instance_valid(marker_node_3d):
			marker_node_3d.queue_free()
			#print('bis hier')
		
		marker_tscn=sceens_tscn[new_index]
		marker_node_3d=marker_tscn.instantiate()
		turn_off_collider(marker_node_3d)
		add_child(marker_node_3d)
		marker_node_3d.position=temp_position
		marker_node_3d.rotation =temp_rotation
		last_selected_index=new_index
		print('new index: ',last_selected_index)
		
func doTheRaycast(camera: Camera3D):
	if Engine.is_editor_hint():
		marker_node_3d.hide()
		var from: Vector3 = camera.project_ray_origin(new_click_location)
		var to: Vector3 = from+camera.project_ray_normal(new_click_location) * 1000
		
		var result_position: Vector3 = Vector3.INF
		var result: Dictionary =await camera.get_world_3d().direct_space_state.intersect_ray(PhysicsRayQueryParameters3D.create(from, to))

		if result != null and  result.is_empty()==false:
			result_position = result["position"]
			print(result_position)
		new_intersection_result_dict=result

			##print('kein Result gefunden.')
		if result_position == Vector3.INF:
			marker_node_3d.hide()
			print('no hit position')
		else:
			if result != null and  result.is_empty()==false:
				var col_nor = result.normal
				#print(col_nor)
				var col_point = result_position
				
				marker_node_3d.show()
			
				
				marker_node_3d.transform=align_with_normal(marker_node_3d.transform,col_nor)
				marker_node_3d.position = col_point
				print(marker_node_3d.transform)
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
		
		var instanciated_object:Node3D
		if do_we_have_scenes_available:
			instanciated_object = marker_tscn.instantiate()
		else:
			var marker_replacer: MeshInstance3D = MeshInstance3D.new()
			marker_replacer.mesh =BoxMesh.new()
			instanciated_object =marker_replacer
		
		var sceneroot=get_tree().edited_scene_root
			#print(sceneroot.name)		
		sceneroot.add_child(instanciated_object,true)
		instanciated_object.owner =sceneroot
		instanciated_object.position=marker_node_3d.position
		instanciated_object.rotation=marker_node_3d.rotation
		print("das itst der new transform", instanciated_object.transform)
		
	
