extends Area2D
class_name pick_up_able


func _on_area_entered(area:Area2D):
	if not area is pick_up:
		return
	owner.queue_free()
