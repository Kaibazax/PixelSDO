shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float px=TEXTURE_PIXEL_SIZE.x;
	float py=TEXTURE_PIXEL_SIZE.y;
	float r0=texture(TEXTURE,vec2(UV.x,UV.y)).s;
	float r1=r0-texture(TEXTURE,vec2(UV.x-px,UV.y)).s;
	float g1=r0-texture(TEXTURE,vec2(UV.x,UV.y+py)).s;
	//r1=r1*2.0-1.0;
	//g1=g1*2.0-1.0;
	//vec3 vc=cross(normalize(vec3(1,0,r1)),normalize(vec3(0,1,g1)));
	vec3 vc=normalize(cross(vec3(1,0,r1),vec3(0,1,g1)));
	COLOR=vec4(vc.r/2.0+0.5,vc.g/2.0+0.5,vc.b,1);
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
