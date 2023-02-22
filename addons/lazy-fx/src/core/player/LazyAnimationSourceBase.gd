tool
extends Node


export var _player_path : NodePath = ".."
onready var _player = get_node(_player_path)

var _prev_name


func _ready():
	_prev_name = name
	connect("renamed", self, "_on_renamed")
	_add_to_player()


func _enter_tree():
	if _player:
		_add_to_player()


func _exit_tree():
	_player.remove(name)


func _add_to_player():
	_player.add(name, _animation())
	if Engine.editor_hint:
		_player.reset()


func _animation():
	return LazyAnimationEmpty.new()


func _on_renamed():
	if _player:
		_player.remove(_prev_name)
	_prev_name = name
	_add_to_player()
