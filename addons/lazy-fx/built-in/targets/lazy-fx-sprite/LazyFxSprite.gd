tool
extends Sprite


func get_fx_value(name):
	return get_indexed(name)


func set_fx_value(name, value):
	set_indexed(name, value)


func has_fx_value(name):
	return get_indexed(name) != null
