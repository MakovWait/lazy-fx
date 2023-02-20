shader_type canvas_item;

uniform vec2 skew = vec2(0, 0);
uniform float blink_progress : hint_range(0, 1) = 0;
uniform vec4 blink_color : hint_color = vec4(1, 1, 1, 1);

vec3 interpolate_vec3(vec3 start, vec3 end, float delta){
	return start + (end - start) * delta;
}

void fragment(){
	vec4 origin = texture(TEXTURE, UV);
	COLOR.rgb = interpolate_vec3(origin.rgb, blink_color.rgb, blink_progress);
	COLOR.a = origin.a;
}

void vertex() {
	VERTEX.x -= VERTEX.y * skew.x;
	VERTEX.y -= VERTEX.x * skew.y;
}
