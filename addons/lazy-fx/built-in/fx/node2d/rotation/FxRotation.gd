class_name FxRotation
extends Node


var _from
var _to


func _init(from, to):
	self._from = FxUtils.scalar_of(from)
	self._to = FxUtils.scalar_of(to)


func apply(target, x):
	target.set_fx_value(
		"rotation", 
		lerp(deg2rad(_from.value()), deg2rad(_to.value()), x)
	)
