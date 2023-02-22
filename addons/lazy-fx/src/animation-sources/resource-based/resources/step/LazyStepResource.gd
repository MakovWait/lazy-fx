tool
class_name LazyStepResource
extends Resource

const ease_functions = preload("res://addons/lazy-fx/deps/ease/Ease.gd")


const _time_steps = {
	"Ping Pong": StepTimePingPong,
	"Continuous": StepTimeContinuous
}


export(String, "Ping Pong", "Continuous") var _time = "Ping Pong" setget _set_time
export(
	String, 
	"Linear",
	"EaseInSine",
	"EaseOutSine",
	"EaseInOutSine",
	"EaseInQuad",
	"EaseOutQuad",
	"EaseInOutQuad",
	"EaseInPoly",
	"EaseOutPoly",
	"EaseInOutPoly",
	"EaseInExpo",
	"EaseOutExpo",
	"EaseInOutExpo",
	"EaseInCirc",
	"EaseOutCirc",
	"EaseInOutCirc",
	"EaseInBack",
	"EaseOutBack",
	"EaseInOutBack",
	"EaseInElastic",
	"EaseOutElastic",
	"EaseInOutElastic",
	"EaseInBounce",
	"EaseOutBounce",
	"EaseInOutBounce"
) var _easing = "Linear" setget _set_easing


func step():
	return _time_step(_easing_step())


func _time_step(easing):
	if _time_steps.has(_time):
		return _time_steps[_time].new(easing)
	else:
		return easing


func _easing_step():
	if _easing == 'Linear':
		return StepEaseLerp.new()
	else:
		var ease_name = _easing[0].to_lower() + _easing.substr(1)
		return StepEaseFuncRef.new(funcref(ease_functions, ease_name))


func _set_easing(value):
	_easing = value
	emit_changed()


func _set_time(value):
	_time = value
	emit_changed()
