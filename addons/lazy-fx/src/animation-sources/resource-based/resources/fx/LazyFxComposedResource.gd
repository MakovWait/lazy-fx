tool
class_name LazyFxComposedResource
extends Resource


export(Array, Resource) var _effects setget _set_effects


func fx():
	var fx_list = []
	for fx_source in _effects:
		if _resource_is_invalid(fx_source):
			continue
		fx_list.append(fx_source.fx())
	return FxComposed.new(fx_list)


func _resource_is_invalid(x):
	return x == null or not x.has_method("fx")


func _set_effects(value):
	_effects = value
	emit_changed()
