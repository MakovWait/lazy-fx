class_name ScalarDeg2Rad
extends Scalar


var _origin


func _init(origin):
	self._origin = origin


func value():
	return deg2rad(_origin.value())
