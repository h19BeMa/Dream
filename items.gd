extends Node2D
class_name DialogueAction

onready var text_label = get_node("RichTextLabel")

export (String, FILE, "*.json") var dialogue_file_path : String
var dpath = "data/dialogue.json"

func interact() -> void:
	var dialogue : Dictionary = load_dialogue(dpath)
	text_label.text = dialogue["001"]["text"]
	
	
	
func load_dialogue(file_path) -> Dictionary:

	var file = File.new()
	assert(file.file_exists(file_path))
	
	file.open(file_path, file.READ)
	var dialogue = parse_json(file.get_as_text())
	assert(dialogue.size() > 0)
	return dialogue 
 



