tool
extends EditorPlugin


func _enter_tree():
	add_custom_type(
		"LazyAnimationPlayer", 
		"Node", 
		preload("res://addons/lazy-fx/src/core/player/LazyAnimationPlayer.gd"),
		null
	)
	add_custom_type(
		"LazyResourceAnimationSource", 
		"Node", 
		preload("res://addons/lazy-fx/src/animation-sources/resource-based/LazyResourceAnimationSource.gd"),
		null
	)
	add_custom_type(
		"LazyAutoPlay", 
		"Node", 
		preload("res://addons/lazy-fx/src/core/player/LazyAutoPlay.gd"),
		null
	)


func _exit_tree():
	remove_custom_type("LazyAnimationPlayer")
	remove_custom_type("LazyResourceAnimationSource")
	remove_custom_type("LazyAutoPlay")
