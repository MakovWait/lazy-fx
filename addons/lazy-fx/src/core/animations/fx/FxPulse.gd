class_name FxPulse
extends Reference


var _from
var _to
var _color


func _init(from, to, color):
	self._from = FxUtils.scalar_of(from)
	self._to = FxUtils.scalar_of(to)
	self._color = FxUtils.scalar_of(color)


func apply(target, x):
	target.set_fx_value(
		"material:shader_param/blink_progress",
		lerp(_from.value(), _to.value(), x)
	)
	
	target.set_fx_value(
		"material:shader_param/blink_color",
		_color.value()
	)
