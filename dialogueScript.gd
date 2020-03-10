extends Area2D
class_name DialogueAction

onready var movement = get_node("../../player")
onready var text_label = get_node("../RichTextLabel")

var dia_index = 1


export (String, FILE, "*.json") var dialogue_file_path : String
var dpath = "data/dialogue.json"
var dialogue : Dictionary

func _ready():
	text_label.hide()
	dialogue = load_dialogue(dpath)

func interact() -> void:
	if dialogue.size() > 1:
		text_label.visible == false
		movement.SPEED = 0
		text_label.show()
		
		if dia_index != dialogue.size() + 1:	
			text_label.text = dialogue[str(dia_index)]["text"]
			dia_index += 1
		else:
			dia_index = 1
			text_label.hide()
			movement.SPEED = 200
			
		
	elif dialogue.size() == 1: 
		text_label.visible == false
		movement.SPEED = 0
		text_label.show()
		text_label.text = dialogue["1"]["text"]
		
	else:
		text_label.hide()
		movement.SPEED = 200
	
	
	
	
func load_dialogue(file_path) -> Dictionary:

	var file = File.new()
	assert(file.file_exists(file_path))
	
	file.open(file_path, file.READ)
	var dialogue = parse_json(file.get_as_text())
	assert(dialogue.size() > 0)
	return dialogue 
