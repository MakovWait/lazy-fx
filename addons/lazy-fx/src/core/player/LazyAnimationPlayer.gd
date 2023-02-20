tool
extends Node

signal animation_added(name)

export var _target_path : NodePath = ".."
onready var _target = get_node(_target_path)
export var _preview = false setget _set_preview

var _animation_empty = LazyAnimationEmpty.new()

var _time = 0.0
var _animations = {}
var _action_animation_name


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


func play(name):
	if not _animations.has(name):
		printerr(
			"Animation '%s' was not found. Current animations are: %s" % [name, _animations.keys()]
		)
	_action_animation_name = name
	reset()


func play_external(time):
	_active_animation().play(_target, time)


func _process(delta):
	play_external(_time)
	_time += delta


func _active_animation():
	if _animations.has(_action_animation_name):
		return _animations[_action_animation_name]
	else:
		return _animation_empty


func _set_preview(value):
	_preview = value
	_update_processing()
	if _target:
		_target.reset()


func _update_processing():
	if Engine.editor_hint:
		set_process(_preview)
	else:
		set_process(true)
