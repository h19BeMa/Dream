extends Node
class_name item_class

var items : Dictionary
var item_characteristics : Dictionary

func _ready():
	all_items()
	
func _init():
	pass

func all_items():
	
	items = {"1" : {"name": "yellow_key", "is_picked": false},
			 "2" : {"name": "red_key", "is_picked": false}}
	
	pass
