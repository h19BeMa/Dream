extends Node
class_name item_class

var items : Dictionary
var item_characteristics : Dictionary

func _ready():
	all_items()
	
func _init():
	pass

func all_items():
	
	items = {"1" : {"name": "yellow_key", "is_picked": false, "item_path": "data/dialogue.json"},
			 "2" : {"name": "cottage_door", "is_open": false, "item_path": "data/dialogue_door.json"},
			 "3" : {"name": "sword", "is_picked": false, "item_path": "data/dialogue_sword.json"}}
	
