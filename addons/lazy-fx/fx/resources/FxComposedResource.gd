tool
class_name FxComposedResource
extends Resource


export(Array, Resource) var _effects setget _set_effects


func fx():
	var fx_list = []
	for fx_source in _effects:
		if fx_source == null:
			continue
		fx_list.append(fx_source.fx())
	return FxComposed.new(fx_list)


func _set_effects(value):
	_effects = value
	emit_changed()
