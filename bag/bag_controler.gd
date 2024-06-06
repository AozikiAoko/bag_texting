extends Panel

@onready var itemslots=%GridContainer.get_children()
var Bag_Inventory=preload("res://item/bag_inventory.tres")

var slot:Array[slots]

func _ready():
	slot=Bag_Inventory.slot
	Bag_Inventory.updated.connect(update)
	update()
	Bag_Inventory.init(itemslots.size())


func update():
	for i in min(itemslots.size(), slot.size()):
		itemslots[i].itemslot = slot[i]
		itemslots[i].update()
