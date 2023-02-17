class_name FxBurstValue
extends Reference


var _property
var _from
var _to
var _wobble


func _init(prop, from, to, wobble):
	self._property = FxUtils.scalar_of(prop)
	self._from = FxUtils.scalar_of(from)
	self._to = FxUtils.scalar_of(to)
	self._wobble = FxUtils.scalar_of(wobble)


func validate(target, erors):
	pass


func apply(target, x):
	var delta = _to.value() - _from.value()
	target.set_fx_value(
		_property.value(),
		_from.value() + delta * _ease_out_elastic(x, 0, 1, _wobble.value())
	)


func _ease_out_elastic(x: float, offset: float=0, length: float=1, wobble: float=10) -> float:
	x -= offset
	var length_trans = 10 / length
	var c4 = (2 * PI) / 3
	return (0.0 if x < 0 else (1.0 if x > length else pow(2, -length_trans * x) * sin((x * wobble - 0.75) * c4) + 1))
