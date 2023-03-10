tool
extends Sprite

var shader = preload("res://addons/lazy-fx/src/core/targets/lazy-fx-sprite/lazy_fx.gdshader")

var default_fields = {
	'position': Vector2.ZERO,
	'scale': Vector2(1, 1),
	'rotation': 0.0,
	'material:shader_param/blink_progress': 0.0,
	'material:shader_param/blink_color': Color.white,
	'material:shader_param/skew': Vector2.ZERO,
}


func _ready():
	if not material:
		var lazy_material = ShaderMaterial.new()
		lazy_material.shader = shader
		material = lazy_material
	reset()


func _enter_tree():
	call_deferred("reset")


func reset():
	for field in default_fields.keys():
		set_fx_value(field, default_fields[field])


func get_fx_value(name):
	return get_indexed(name)


func set_fx_value(name, value):
	set_indexed(name, value)


func has_fx_value(name):
	return get_indexed(name) != null
