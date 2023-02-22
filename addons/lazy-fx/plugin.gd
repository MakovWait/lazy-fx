tool
extends EditorPlugin


func _enter_tree():
	add_custom_type(
		"LazyAnimationPlayer", 
		"Node", 
		preload("res://addons/lazy-fx/src/core/player/LazyAnimationPlayer.gd"),
		preload("res://addons/lazy-fx/icons/LazyAnimationPlayer.svg")
	)
	add_custom_type(
		"LazyResourceAnimationSource", 
		"Node", 
		preload("res://addons/lazy-fx/src/animation-sources/resource-based/LazyResourceAnimationSource.gd"),
		preload("res://addons/lazy-fx/icons/Animation.svg")
	)
	add_custom_type(
		"LazyAutoPlay", 
		"Node", 
		preload("res://addons/lazy-fx/src/core/player/LazyAutoPlay.gd"),
		preload("res://addons/lazy-fx/icons/AutoPlay.svg")
	)
	add_custom_type(
		"LazyFxSprite", 
		"Sprite", 
		preload("res://addons/lazy-fx/src/core/targets/lazy-fx-sprite/LazyFxSprite.gd"),
		preload("res://addons/lazy-fx/icons/LazySprite2D.svg")
	)


func _exit_tree():
	remove_custom_type("LazyAnimationPlayer")
	remove_custom_type("LazyResourceAnimationSource")
	remove_custom_type("LazyAutoPlay")
	remove_custom_type("LazyFxSprite")
