tool
class_name LazyAnimationSourceBase
extends Node


export var _player_path : NodePath = ".."
onready var _player = get_node(_player_path)
export var _name = ""


func _ready():
	_add_to_player()


func _exit_tree():
	_player.remove(self._name)


func _add_to_player():
	_player.add(self._name, _animation())
	if Engine.editor_hint:
		_player.reset()


func _animation():
	return LazyAnimationEmpty.new()
