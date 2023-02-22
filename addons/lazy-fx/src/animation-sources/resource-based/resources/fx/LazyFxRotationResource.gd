tool
class_name LazyFxRotationResource
extends Resource

export var _display_name = "rotation"
export(float, -360, 360) var _from = 0.0
export(float, -360, 360) var _to = 0.0


func fx():
	return FxSetLerpValue.new(
			"rotation",
			ScalarDeg2Rad.new(ScalarRef.new(self, "_from")), 
			ScalarDeg2Rad.new(ScalarRef.new(self, "_to"))
		)
