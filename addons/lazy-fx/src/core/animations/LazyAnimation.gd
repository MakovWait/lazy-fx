class_name LazyAnimation
extends Reference


var _fx
var _step
var _duration


func _init(fx, step, duration):
	self._fx = fx
	self._step = step
	self._duration = FxUtils.scalar_of(duration)


func validate(target, errors):
	_fx.validate(target, errors)


func play(target, time):
	_fx.apply(target, _step.value(time, _duration.value()))
