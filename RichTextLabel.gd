extends RichTextLabel

var dialog = ["test"]
var page = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)


func _input(event):
	if event.type == Input.is_action_pressed("ui_select") && event.is_pressed():
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
		

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
