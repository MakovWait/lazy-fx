class_name ScalarRef
extends Scalar


var _source
var _name


func _init(src, name):
	self._source = src
	self._name = name


func value():
	return _source.get_indexed(_name)
