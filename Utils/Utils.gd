class_name Utils


static func get_random_item():
	var path="res://item/items/"
	var dir=DirAccess.open(path)
	var files=dir.get_files()
	var index=randf_range(0,files.size()-1)
	var items_name=files[index]
	var resource=ResourceLoader.load(path+items_name)
	return resource

static func get_random_item_position(taget_position:Vector2):
	var distance=Vector2.RIGHT*randf_range(100,300)
	var pos=distance.rotated(randf_range(0,TAU))+taget_position
	return pos
	
