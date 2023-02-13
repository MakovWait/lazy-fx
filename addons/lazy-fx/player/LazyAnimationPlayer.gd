tool
extends Node

export var _target_path : NodePath = ".."
onready var _target = get_node(_target_path)

var _animation_empty = LazyAnimationEmpty.new()

var _time = 0
var _animations = {}
var _action_animation_name


func add(name, animation):
	_animations[name] = animation


func remove(name):
	_animations.erase(name)


func play(name):
	if _animations[name] == null:
		# TODO add name to error
		printerr("Animation was not found")
	_time = 0
	_action_animation_name = name


func _process(delta):
	_active_animation().play(_target, _time)
	_time += delta


func _active_animation():
	if _animations.has(_action_animation_name):
		return _animations[_action_animation_name]
	else:
		return _animation_empty
