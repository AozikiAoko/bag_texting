extends MarginContainer
class_name InventoryCell

@onready var icon=%icon
@onready var count=%count

signal state_change

func update(inventoryslots:slots):#更新物品栏插槽的状态
	if !inventoryslots||inventoryslots.is_Empty():
		icon.texture=null
		count.text=""

		return
		
	icon.texture=inventoryslots.item.icon
	
	var text=""
	if  inventoryslots.count>1:
		text=str(inventoryslots.count)

		
	count.text=text
	


	
