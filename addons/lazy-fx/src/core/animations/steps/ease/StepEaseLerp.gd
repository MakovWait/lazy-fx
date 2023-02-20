class_name StepEaseLerp
extends Reference


var _from
var _to

func _init(from=0, to=1):
	self._from = from
	self._to = to


func value(time, duration):
	return lerp(_from, _to, time / duration) 
