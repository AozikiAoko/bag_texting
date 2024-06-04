extends Resource

class_name inventory

@export var slot:Array[slots]

signal updated

func init(size:int=10):
	slot.resize(size)
	for i in size:
		if !slot[i]:
			slot[i]=slots.new()

func Add(item:items_father):#物品被拾起的时候就会放入背包
	if slot.is_empty():
		init()
		
	for sl in slot:
		if sl.item:
			if sl.item.name==item.name:
				sl.count+=1
				updated.emit()
				return
			continue
			
		else:
			sl.item=item 
			sl.count=1
			updated.emit()
			return
			
			
			
				
