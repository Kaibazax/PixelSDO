extends Control

@onready var vp:SubViewport=$HBoxContainer/SubViewportContainer/SubViewport
@onready var cr:ColorRect=$HBoxContainer/SubViewportContainer/SubViewport/ColorRect
@onready var degTxt=$HBoxContainer/VBoxContainer/HFlowContainer/CodeEdit
@onready var txtCode=$HBoxContainer/VBoxContainer/HBoxContainer/TextEdit
@onready var txtRgb=$HBoxContainer/VBoxContainer/TextEdit2
@export var color:Color
var mouseHover=false
#@onready var point:SubViewport=$SubViewportContainer/Node2D
signal pointerChange(color:Color)
signal hoverPointerChange(color:Color)
#@onready var s:Sprite2D=$Sprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _gui_input(event):
	#if event is InputEventMouseMotion:
		#var mi:InputEventMouseMotion=event
		##clamp()
		#var img=get_viewport().get_texture().get_image()
		##var img=s.texture.get_image()
		##img.lock()
		#var pixel=img.get_pixel(mi.position.x,mi.position.y);
		##img.unlock()
		##var pixel2=$SubViewportContainer/SubViewport/ColorRect.get_t
		#
		#print(mi.position)
		#print( pixel.to_html())
		#
	var evt=cr.make_input_local(event)
	var p=evt.position
	if !mouseHover or p.x<0 or p.y<0:
		return
	if event is InputEventMouseMotion:
		var img=vp.get_texture().get_image()
		var pixel=img.get_pixel(p.x,p.y);
		hoverPointerChange.emit(pixel)
	if event is InputEventMouseButton and event.button_index==MOUSE_BUTTON_LEFT:
		#var mi:InputEventMouseButton=event
		#mi.button_index
		#clamp()
		var img=vp.get_texture().get_image()
		#var img=s.texture.get_image()
		#img.lock()
		var pixel=img.get_pixel(p.x,p.y);
		#img.unlock()
		#var pixel2=$SubViewportContainer/SubViewport/ColorRect.get_t
		pointerChange.emit(pixel)
		txtCode.text=pixel.to_html(false)
		var format_string = "(%1.2f,%1.2f,%1.2f)"
		txtRgb.text=format_string % [pixel.r,pixel.g,pixel.b]
		#txtRgb.text=pixel
		#print(position)
		#print( pixel.to_html())
	pass

func _on_spin_box_value_changed(value):
	pass # Replace with function body.

func _on_spin_box_2_value_changed(value):
	cr.material.set_shader_parameter ( "ringsNo",value )
	pass # Replace with function body.

func _on_button_pressed():
	DisplayServer.clipboard_set(txtCode.text)
	pass # Replace with function body.

func _on_btn_deg_add_pressed():
	var value=int(degTxt.text)
	match value:
		1: value=5
		5: value=10
		10: value=15
		15: value=30
		30: value=45
		45: value=90
		#60: value=90
	degTxt.text="%d" % value
	cr.material.set_shader_parameter ( "degNo",value )
	pass # Replace with function body.

func _on_btn_deg_sub_pressed():

	var value=int(degTxt.text)
	match value:
		5: value=1
		10: value=5
		15: value=10
		30: value=15
		45: value=30
		90: value=45
		#90: value=60
	degTxt.text="%d" % value
	cr.material.set_shader_parameter ( "degNo",value )
	pass # Replace with function body.

func _on_color_rect_mouse_entered():
	mouseHover=true
	pass # Replace with function body.

func _on_color_rect_mouse_exited():
	mouseHover=false
	pass # Replace with function body.
