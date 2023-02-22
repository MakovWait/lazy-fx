tool
class_name LazyFxScaleResource
extends Resource

export var _display_name = "scale"
export var _from = Vector2.ZERO
export var _to = Vector2.ZERO


func fx():
	return FxSetLerpValue.new(
			"scale",
			ScalarRef.new(self, "_from"), 
			ScalarRef.new(self, "_to")
		)

