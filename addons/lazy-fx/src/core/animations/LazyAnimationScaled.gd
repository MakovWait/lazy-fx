class_name LazyAnimationScaled
extends Node

var _origin
var _speed


func _init(origin, speed):
	self._origin = origin
	self._speed = FxUtils.scalar_of(speed)


func validate(target, errors):
	_origin.validate(target, errors)


func play(target, time):
	_origin.play(target, time * _speed.value())
