extends Panel

@onready var itemslots=%GridContainer.get_children()
var Bag_Inventory=preload("res://item/bag_inventory.tres")

var slot:Array[slots]

func _ready():
	slot=Bag_Inventory.slot
	Bag_Inventory.updated.connect(update)
	update()
	Bag_Inventory.init(itemslots.size())
	
func _input(event):
	if event.is_action_pressed("bag"):
		visible=!visible
	elif event.is_action_pressed("exit_bag"):
		visible=false


func update():
	for i in min(itemslots.size(),slot.size()):
		itemslots[i].inventoryslots=slot[i]
		itemslots[i].update()
