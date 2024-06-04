extends PanelContainer
class_name InventoryGUI

@onready var background=%background
@onready var icon=%icon
@onready var count=%count

var inventoryslots:slots

func _ready():
	background.frame=1

func update():
	if !inventoryslots||!inventoryslots.item:
		icon.texture=null
		count.text=""
		background.frame=1
		return
		
	background.frame=0
	icon.texture=inventoryslots.item.icon
	
	var text=""
	if  inventoryslots.count>1:
		text=str(inventoryslots.count)
		
	count.text=text

