extends PanelContainer
class_name InventorySolt

@onready var background=%background
@onready var inventory_cell=$inventoryCell

var itemslot:slots=slots.new()
var InventoriesContainer



func _ready():
	background.frame=1#后面尝试把这个frame进行变化
	InventoriesContainer=get_tree().get_first_node_in_group("InventoriesContainer")

func update():
	inventory_cell.update(itemslot)
	
func switch_state(state:bool):#物品被鼠标拾起的时候就把原来位置的物品变成半透明
	if state:
		inventory_cell.modulate=Color(1,1,1,0.5)
	else:
		inventory_cell.modulate=Color(1,1,1,1)



func _on_gui_input(event:InputEvent):#调用鼠标点击触发事件
	if event.is_action_pressed("mouse_left"):
		if !InventoriesContainer:
			return
		InventoriesContainer.on_mouse_Item_Click(self)	
		

func _on_inventory_cell_state_change():#暂时不实现这个功能
	if background.frame==0:
		background.frame=1
	else:
		background.frame=0
