tool
extends Node


var _animation_name
export var _player_path : NodePath = ".."
export var _trigger_editor_play: bool setget _set_trigger_play


func _ready():
	_play_animation()



func _get(property):
	if property == "_animation_name":
		return _animation_name


func _set(property, value):
	if property == "_animation_name":
		_animation_name = value
		_play_animation()
		return true
	return false


func _get_property_list():
	return [{
		'name': '_animation_name',
		'type': TYPE_STRING,
		'hint_string': get_node(_player_path).animation_names().join(','),
		'hint': PROPERTY_HINT_ENUM
	}]


func _play_animation():
	var player = get_node(_player_path)
	if player.has_animation(_animation_name):
		player.play(_animation_name)


func _set_trigger_play(value):
	_play_animation()
	var player = get_node(_player_path)
	if Engine.editor_hint:
		player.change_preview_mode(true)
#	if not player.is_in_preview_mode():
#		push_warning("Target Player {%s} is not in preview mode" % player.name)
	player.check_animation_is_registered(_animation_name)
