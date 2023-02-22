tool
class_name LazyAnimationBurstResource
extends Resource


export var _duration = 1.0
export var _period = 10.0
export var _amplitude = 0.0

export var _fx : Resource setget _set_fx


func animation():
	var fx
	if _fx_is_invalid(_fx):
		fx = FxEmpty.new()
	else:
		fx = _fx.fx()

	return LazyAnimation.new(
		fx,
		StepEaseOutElastic.new(
			ScalarRef.new(self, "_period"), 
			ScalarRef.new(self, "_amplitude")
		),
		ScalarRef.new(self, "_duration")
	)


func _fx_is_invalid(x):
	return x == null or not x.has_method("fx")


func _step_is_invalid(x):
	return x == null or not x.has_method("step")


func _set_fx(value):
	_disconnect_from(_fx)
	_fx = value
	_connect_to(value)
	emit_changed()


func _disconnect_from(x):
	if x == null:
		return
	x.disconnect("changed", self, "_on_resource_internals_changed")


func _connect_to(x):
	if x == null:
		return
	x.connect("changed", self, "_on_resource_internals_changed")


func _on_resource_internals_changed():
	emit_changed()
