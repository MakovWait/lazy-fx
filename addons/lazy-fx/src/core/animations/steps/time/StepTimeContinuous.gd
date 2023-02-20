class_name StepTimeContinuous
extends Reference


var _origin
var _from
var _to


func _init(origin):
	self._origin = origin


func value(time, duration):
	return _origin.value(
		fmod(time, duration),
		duration
	)


