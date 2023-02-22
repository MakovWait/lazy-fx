class_name StepEaseOutElastic
extends Reference

var _period
var _amplitude


func _init(period, amplitude):
	self._period = FxUtils.scalar_of(period)
	self._amplitude = FxUtils.scalar_of(amplitude)


func value(time, duration):
	return _ease_out_elastic(time / duration, 0, 1, 1, _amplitude.value(), _period.value())


func _ease_out_elastic(t: float, b: float, c: float, d: float, a: float = 0, p: float = 0) -> float:
	if t == 0:
		return b
	t = t / d
	if t == 1:
		return b + c
		
	if p == 0:
		p = d * 0.3

	var s: float
	if a == 0:
		a = c
		s = p / 4
	else:
		s = p / (2 * PI) * asin(c / a)

	return a * pow(2, -10 * t) * sin((t * d - s) * (2 * PI) / p) + c + b
