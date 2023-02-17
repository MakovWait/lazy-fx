tool
extends LazyAnimationSourceBase


export var _resource : Resource setget _set_resource


func _animation():
	if _resource_is_invalid(_resource):
		return LazyAnimationEmpty.new()
	else:
		return _resource.animation()


func _resource_is_invalid(x):
	return x == null or not x.has_method("animation")


func _set_resource(value):
	if _resource != null:
		_resource.disconnect("changed", self, "_on_resource_internals_changed")
	_resource = value
	if _resource != null:
		_resource.connect("changed", self, "_on_resource_internals_changed")
	if is_inside_tree():
		_add_to_player()


func _on_resource_internals_changed():
	if is_inside_tree():
		_add_to_player()
