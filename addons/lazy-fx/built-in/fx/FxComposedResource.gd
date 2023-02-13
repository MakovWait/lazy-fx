tool
class_name FxComposedResource
extends Resource


export(Array, Resource) var _resources setget _set_resources


func fx():
	var fx_list = []
	for res in _resources:
		if res == null:
			continue
		fx_list.append(res.fx())
	return FxComposed.new(fx_list)


func _set_resources(value):
	_resources = value
	emit_changed()
