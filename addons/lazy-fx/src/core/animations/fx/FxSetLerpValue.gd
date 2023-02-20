class_name FxSetLerpValue
extends Reference


var _property
var _from
var _to


func _init(prop, frm, to):
	self._property = FxUtils.scalar_of(prop)
	self._from = FxUtils.scalar_of(frm)
	self._to = FxUtils.scalar_of(to)


func validate(target, erors):
	pass


func apply(target, x):
	target.set_fx_value(
		_property.value(),
		lerp(_from.value(), _to.value(), x)
	)
