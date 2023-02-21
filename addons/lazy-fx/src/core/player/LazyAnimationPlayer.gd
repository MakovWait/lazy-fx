tool
extends Node

signal animation_added(name)

export var _target_path : NodePath = ".."
onready var _target = get_node(_target_path)
export var _preview = false setget _set_preview

var _animation_empty = LazyAnimationEmpty.new()

var _time = 0.0
var _animations = {}
var _active_animation_name


func _ready():
	_update_processing()


func add(name, animation):
	_animations[name] = animation
	emit_signal("animation_added", name)


func remove(name):
	_animations.erase(name)


func reset():
	_time = 0
	if _target:
		_target.reset()


func is_in_preview_mode():
	return _preview


func active_animation_is(name):
	return name == _active_animation_name


func has_animation(name):
	return _animations.has(name)


func animation_names():
	return PoolStringArray(_animations.keys())


func change_preview_mode(value):
	self._preview = value


func check_animation_is_registered(name):
	if not _animations.has(name):
		printerr(
			"%s error: Animation '%s' was not found. Current animations are: %s" % [self.name, name, _animations.keys()]
		)


func play(name):
	if Engine.editor_hint:
		update_configuration_warning()
	check_animation_is_registered(name)
	_active_animation_name = name
	reset()


func play_external(time):
	_active_animation().play(_target, time)


func _process(delta):
	play_external(_time)
	_time += delta


#func _set(property, value):
#	if property == 'debug/active_animation':
#		return false
#	return false


func _get(property):
	if property == 'debug/active_animation':
		return _active_animation_name
	if property == 'debug/animations':
		return self.animation_names().join(',')


func _get_property_list():
	var result = []
	result.push_back({
		'name': 'debug/active_animation',
		'type': TYPE_STRING
	})
	result.push_back({
		'name': 'debug/animations',
		'type': TYPE_STRING
	})
	return result


func _active_animation():
	if _animations.has(_active_animation_name):
		return _animations[_active_animation_name]
	else:
		return _animation_empty


func _set_preview(value):
	_preview = value
	_update_processing()
	if _target:
		_target.reset()
	update_configuration_warning()


func _update_processing():
	if Engine.editor_hint:
		set_process(_preview)
	else:
		set_process(true)


func _get_configuration_warning():
	if _preview:
		return 'Preview mode is enabled. Current animation is %s' % _active_animation_name
	return ''
