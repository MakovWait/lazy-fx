tool
extends Node


export var _animation_name = "default"
export var _player_path : NodePath = ".."


func _ready():
	get_node(_player_path).play(_animation_name)
