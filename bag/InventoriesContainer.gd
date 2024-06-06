extends Panel

@onready var bag=$bag
@onready var inventorycell=$InventoryCell

var isMouseItemVisible=false
var itemSlotNode:InventorySolt


	
func _input(event):
	if event.is_action_pressed("bag"):
		visible=!visible
	elif event.is_action_pressed("exit_bag"):
		visible=false
		
	if event.is_action_pressed("mouse_left"):
		isMouseItemVisible=false

func _process(_delta):#这里简单地说就是实现鼠标点击后物品图片纹理以及数字在背包里的反应
	if isMouseItemVisible:
		inventorycell.position=get_viewport().get_mouse_position()
	else :
		inventorycell.visible=false
		
func on_mouse_Item_Click(slotNode:InventorySolt):
	#slotnode指的是每个背包格子的InventorySlot节点，而itemSlotNode指的是控制鼠标上对象的，只引用方法的InventorySlot
	#鼠标无、背包无
	if !itemSlotNode&&slotNode.itemslot.is_Empty():
		return#什么都不做
		
	#鼠标有、背包无
	if itemSlotNode&&slotNode.itemslot.is_Empty():
		slotNode.itemslot=itemSlotNode.itemslot#把鼠标中相应的对象以及相应的数值传到背包里
		slotNode.update()
	
		#创建slot对象调用相应方法，更新之后就释放鼠标插槽里的内容
		itemSlotNode.itemslot=slots.new()
		itemSlotNode.update()
		itemSlotNode.switch_state(false)
		itemSlotNode=null
		isMouseItemVisible=false
		return
	
	#鼠标无，背包有	
	if !itemSlotNode&&!slotNode.itemslot.is_Empty():
		itemSlotNode=slotNode
		slotNode.switch_state(true)
		isMouseItemVisible = true
		inventorycell.update(slotNode.itemslot)
		inventorycell.visible = true				
		return
		
	#鼠标有，背包有
	if itemSlotNode&&!slotNode.itemslot.is_Empty():
		if itemSlotNode == slotNode:#如果两个内容相同就直接释放掉鼠标插槽（可以补充为叠加效果）
			ClearMouseItem()
			return
		var itemSlot = itemSlotNode.itemslot#不相同就把一边的值赋给另一边（这里就是常规地利用中间变量的效果）
		itemSlotNode.itemslot = slotNode.itemslot
		itemSlotNode.update()
		itemSlotNode.switch_state(false)
		
		slotNode.switch_state(false)
		slotNode.itemslot = itemSlot
		slotNode.update()
		
		ClearMouseItem()
		
		
func CreateMouseItem(slotNode):#创建鼠标插槽的功能，可以考虑改成点击事件后后触发的方法
	itemSlotNode = slotNode
	itemSlotNode.switch_state(true)
	isMouseItemVisible = true
	inventorycell.update(slotNode.itemslot)
	inventorycell.visible = true


func ClearMouseItem():#消除鼠标插槽的功能
	itemSlotNode.switch_state(false)
	itemSlotNode = null
	isMouseItemVisible = false
