class_name FxPulse
extends Reference


var _intensity
var _color


func _init(intensity, color):
	self._intensity = FxUtils.scalar_of(intensity)
	self._color = FxUtils.scalar_of(color)


func apply(target, x):
	target.set_fx_value(
		"material:shader_param/blink_progress",
		lerp(0.0, _intensity.value(), x)
	)
	
	target.set_fx_value(
		"material:shader_param/blink_color",
		_color.value()
	)
