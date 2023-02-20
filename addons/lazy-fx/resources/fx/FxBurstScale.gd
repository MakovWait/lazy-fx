tool
class_name FxBurstScale
extends Resource


export(float, -2.0, 2.0) var _value = 0.0
export var _wobble = 10.0


func fx():
	return FxBurstValue.new(
		"scale:x",
		ScalarRef.new(self, "_value"),
		1,
		ScalarRef.new(self, "_wobble")
	)
