extends Node2D
#@onready var mb=$MenuButton

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_menu_button_pressed():
	$MenuBar/MenuButton/PopupMenu.popup()
	pass # Replace with function body.

func _on_popup_menu_index_pressed(index):
	match index:
		#0: #new
		1: #open
			$OpenFileDialog.popup()
	pass # Replace with function body.

func _on_open_file_dialog_file_selected(path):
	pass # Replace with function body.
