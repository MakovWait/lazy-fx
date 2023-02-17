tool
class_name LazyAnimationComposedResource
extends Resource


export(Array, Resource) var _animations setget _set_animations


func animation():
	var animations = []
	for animation_source in _animations:
		if _resource_is_invalid(animation_source):
			continue
		animations.append(animation_source.animation())
	return LazyAnimationComposed.new(animations)


func _resource_is_invalid(x):
	return x == null or not x.has_method("animation")


func _set_animations(value):
	if value != null:
		for x in value:
			self._connect_to(x)
	if _animations != null:
		for x in _animations:
			self._disconnect_from(x)
	_animations = value
	emit_changed()


func _disconnect_from(x):
	x.disconnect("changed", self, "_on_resource_internals_changed")


func _connect_to(x):
	x.connect("changed", self, "_on_resource_internals_changed")


func _on_resource_internals_changed():
	emit_changed()
