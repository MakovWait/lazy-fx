class_name StepEaseOutElastic
extends Reference


var _wobble


func _init(wobble):
	self._wobble = wobble


func value(time, duration):
	return _ease_out_elastic(time / duration, 0, 1, _wobble.value())


func _ease_out_elastic(x: float, offset: float=0, length: float=1, wobble: float=10) -> float:
	x -= offset
	var length_trans = 10 / length
	var c4 = (2 * PI) / 3
	return (0.0 if x < 0 else (1.0 if x > length else pow(2, -length_trans * x) * sin((x * wobble - 0.75) * c4) + 1))
