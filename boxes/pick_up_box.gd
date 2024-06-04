extends Area2D
class_name pick_up

signal pickup(item: items_father)

func _on_area_entered(area:Area2D):
	if not area is pick_up_able:
		return
	
	pickup.emit(area.owner.item)
	print(area.owner.item.name)
