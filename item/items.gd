extends Node2D

var item:items_father
@onready var sprite_2d=$Sprite2D

func _ready():
	item=Utils.get_random_item()
	sprite_2d.texture=item.icon
