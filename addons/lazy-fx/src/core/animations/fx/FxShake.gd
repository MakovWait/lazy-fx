class_name FxShake
extends Reference


var _intensity
var _smooth
var _rotational


func _init(intensity, smooth, rotational):
	self._intensity = FxUtils.scalar_of(intensity)
	self._smooth = FxUtils.scalar_of(smooth)
	self._rotational = FxUtils.scalar_of(rotational)


func apply(target, x):
	var smooth = _smooth.value()
	if min(1.0, x) < 1.0:
		var intensity = _intensity.value()
		var rotational = _rotational.value()
		var rot_offset = (randf() * intensity * rotational - intensity * rotational / 2.0) * smooth
		var pos_offset = Vector2(
			randf() * intensity - intensity / 2.0,
			randf() * intensity - intensity / 2.0
		).linear_interpolate(Vector2.ZERO, smooth) 
		target.set_fx_value("position", pos_offset)
		target.set_fx_value("rotation", rot_offset)
	else:
		target.set_fx_value(
			"position", 
			target.get_fx_value("position").linear_interpolate(Vector2.ZERO, 0.1)
		)
		target.set_fx_value(
			"rotation", 
			lerp(target.get_fx_value("rotation"), 0, 0.1) 
		)
