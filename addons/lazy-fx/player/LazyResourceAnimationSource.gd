tool
extends LazyAnimationSourceBase


export var _resource : Resource setget _set_resource


func _animation():
	if _resource == null:
		return LazyAnimationEmpty.new()
	else:
		return LazyAnimation.new(
			_resource.fx(),
			StepPingPongTime.new(StepLerp.new()),
			0.5
		)


func _set_resource(value):
	if _resource != null:
		_resource.disconnect("changed", self, "_on_resource_internals_changed")
	_resource = value
	_resource.connect("changed", self, "_on_resource_internals_changed")
	if is_inside_tree():
		_add_to_player()


func _on_resource_internals_changed():
	if is_inside_tree():
		_add_to_player()
