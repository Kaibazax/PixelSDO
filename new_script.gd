@tool
extends VisualShaderNodeCustom
class_name VisualShaderMapSteppedLinear

func _init():
	set_input_port_default_value(1,Vector2(0,0))
	set_input_port_default_value(2,Vector2(1,1))
	set_input_port_default_value(3,Vector2(0,0))
	set_input_port_default_value(4,Vector2(1,1))

func _get_name():
	return "Remap2D"


func _get_category():
	return "Z"


func _get_description():
	return "Map Range (Stepped Linear) (based on the Blender Foundation Map Range)"

func _get_return_icon_type():
	return VisualShaderNode.PORT_TYPE_VECTOR_2D

func _get_input_port_count():
	return 5


func _get_input_port_name(port):
	match port:
		0:
			return "value"
		1:
			return "InMin"
		2:
			return "InMax"
		3:
			return "OutMin"
		4:
			return "OutMax"


func _get_input_port_type(port):
	match port:
		0:
			return VisualShaderNode.PORT_TYPE_VECTOR_2D
		1:
			return VisualShaderNode.PORT_TYPE_VECTOR_2D
		2:
			return VisualShaderNode.PORT_TYPE_VECTOR_2D
		3:
			return VisualShaderNode.PORT_TYPE_VECTOR_2D
		4:
			return VisualShaderNode.PORT_TYPE_VECTOR_2D


func _get_output_port_count():
	return 1


func _get_output_port_name(port):
	return "fac"


func _get_output_port_type(port):
	return VisualShaderNode.PORT_TYPE_VECTOR_2D


func _get_global_code(mode):
	return """
		/* === Based on The Blender Foundation shader
		@ https://git.blender.org/gitweb/gitweb.cgi/blender.git/blob/HEAD:/source/blender/gpu/shaders/material/gpu_shader_material_map_range.glsl
		_______________________________________________________________________________________________________________________________________*/

		vec2 remap2d(vec2 value,vec2 InMin,vec2 InMax,vec2 OutMin, vec2 OutMax) {
			float outr = 1.0;
			{
				float __input_range = InMax.r - InMin.r;
				float __output_range = OutMax.r - OutMin.r;
				outr = OutMin.r + __output_range * ((value.r - InMin.r) / __input_range);
			}
			float outg = 1.0;
			{
				float __input_range = InMax.g - InMin.g;
				float __output_range = OutMax.g - OutMin.g;
				outg = OutMin.g + __output_range * ((value.g - InMin.g) / __input_range);
			}
			vec2 output0=vec2(outr,outg);
			return output0;
		}
	"""


func _get_code(input_vars, output_vars, mode, type):
	return output_vars[0] + " = remap2d(%s.xy, %s.xy, %s.xy, %s.xy, %s.xy);" % [input_vars[0], input_vars[1], input_vars[2], input_vars[3], input_vars[4]]
