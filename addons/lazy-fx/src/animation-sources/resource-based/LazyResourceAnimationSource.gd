tool
extends "res://addons/lazy-fx/src/core/player/LazyAnimationSourceBase.gd"

export var _reset : bool setget _editor_trigger_reset
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


func _editor_trigger_reset(value):
	if _player:
		_player.reset()
		if not _player.is_in_preview_mode():
			push_warning("Target Player {%s} is not in preview mode" % _player.name)
		if not _player.active_animation_is(self.name):
			push_warning("Current animation {%s} is not active in {%s}" % [self.name, _player.name])

