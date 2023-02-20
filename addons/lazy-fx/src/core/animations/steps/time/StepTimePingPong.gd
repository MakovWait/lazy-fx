class_name StepTimePingPong
extends Reference


var _origin
var _from
var _to


func _init(origin, from=0, to=1):
	self._origin = origin
	self._from = from
	self._to = to


func value(time, duration):
	return _origin.value(
		_ping_pong(time, duration),
		duration
	)


func _ping_pong(value, length):
	return length / 2.0 * (1.0 - cos(value / length * PI))
