tool
class_name LazyStepResource
extends Resource


var _easings = {
	"Linear": StepLerp
}


var _time_steps = {
	"Ping Pong": StepPingPongTime,
	"Continuous": StepContinuousTime
}


export(String, "Ping Pong", "Continuous") var _time = "Ping Pong" setget _set_time
export(String, "Linear") var _easing = "Linear" setget _set_easing


func step():
	return _time_step(_easing_step())


func _time_step(easing):
	if _time_steps.has(_time):
		return _time_steps[_time].new(easing)
	else:
		return easing


func _easing_step():
	if _easings.has(_easing):
		return _easings[_easing].new()
	else:
		return StepLerp.new()


func _set_easing(value):
	_easing = value
	emit_changed()


func _set_time(value):
	_time = value
	emit_changed()
