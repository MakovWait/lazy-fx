tool
extends LazyAnimationSourceBase

export var _reset : bool setget _editor_trigger_reset
export var _resource : Resource setget _set_resource


#func _ready():
#	set_process(false)
#	set_physics_process(false)
#	set_process_input(false)
#	set_process_unhandled_input(false)
#	set_process_internal(false)
#	set_process_unhandled_key_input(false)
#	set_physics_process_internal(false)


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
