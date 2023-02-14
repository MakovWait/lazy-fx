tool
extends LazyAnimationSourceBase


export var _duration : float = 0.5 setget _set_duration
export var _effect : Resource setget _set_effect


func _animation():
	if _effect == null:
		return LazyAnimationEmpty.new()
	else:
		return LazyAnimation.new(
			_effect.fx(),
			StepPingPongTime.new(StepLerp.new()),
			_duration
		)


func _set_duration(value):
	_duration = value
	if is_inside_tree():
		_add_to_player()


func _set_effect(value):
#	if _effect != null:
#		_effect.disconnect("changed", self, "_on_resource_internals_changed")
	_effect = value
#	_effect.connect("changed", self, "_on_resource_internals_changed")
	if is_inside_tree():
		_add_to_player()


#func _on_resource_internals_changed():
#	if is_inside_tree():
#		_add_to_player()
