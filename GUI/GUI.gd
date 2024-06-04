extends CanvasLayer

const ITEM=preload("res://item/items.tscn")


func _on_button_pressed():
	var player=get_tree().get_first_node_in_group("player")as Node2D
	if !player:
		print("没有player")
		return
	
	var pos=Utils.get_random_item_position(player.global_position)
	var item=ITEM.instantiate()
	item.global_position=pos
	var item_node=get_tree().get_first_node_in_group("items")
	item_node.add_child(item)
	print("运行成功")
