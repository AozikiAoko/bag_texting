extends CharacterBody2D


const SPEED = 500
const ACCEL=1000
var dir=Vector2.ZERO
const BAG_INVENTORY = preload("res://item/bag_inventory.tres")
@onready var pick_up=$pick_up


func _ready():
	pick_up.pickup.connect(_on_pick_up)


func _physics_process(delta):
	Move(delta)

func Move(delta):
	dir.x=Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	dir.y=Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	
	dir=dir.normalized()
	if dir!=Vector2.ZERO:
		velocity+=dir*ACCEL*delta
		velocity=velocity.limit_length(SPEED)
	else:
		velocity=velocity.move_toward(Vector2.ZERO,ACCEL*delta)
	move_and_slide()



func _on_pick_up(item:items_father):
	BAG_INVENTORY.Add(item)
