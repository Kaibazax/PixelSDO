extends Node2D
@export var code:Color=Color(0.5,0.5,1)
@export var color:Color=Color(1,1,1,1)
# Called when the node enters the scene tree for the first time.
func _ready():
	queue_redraw()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func redraw(colorCode:Color):
	code=colorCode
	queue_redraw()
	pass
func _draw():
	var len=100
	var r=30
	var x=remap(code.r,0,1,-1,1)
	var y=remap(code.g,1,0,-1,1)
	var x0=remap(x,-1,1,0,255)
	var y0=remap(y,-1,1,0,255)
	var v=Vector2(x,y)
	var v0=Vector2(x0,y0)
	var v1=Vector2(code.b*r,code.b*r)
	draw_arc(Vector2i(0,0),10,0,360,100,color)
	#draw_circle(Vector2i(0,0),5,Color(1,1,1,0))
	if code.b==1:
		draw_line(Vector2(-10,0),Vector2(10,0),color,2)
	else:
		draw_polyline([Vector2(0,0),
		Vector2(200*(1-code.b),10),
		Vector2(200*(1-code.b-0.1),0),
		Vector2(200*(1-code.b),-10),
		Vector2(0,0)]
		,color,5)
	#
	scale=Vector2(code.b,1)
	#skew=acos(code.b)
	position=v0
	rotation=v.angle()
	#print(scale)
	#draw_arc()
	pass
