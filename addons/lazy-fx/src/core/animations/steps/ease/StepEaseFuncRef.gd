class_name StepEaseFuncRef
extends Reference


var _ref


func _init(ref):
	self._ref = ref


func value(time, duration):
	return _ref.call_funcv([time / duration])
