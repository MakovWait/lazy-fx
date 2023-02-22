tool
class_name LazyFxPositionResource
extends Resource

export var _display_name = "position"
export var _from = Vector2.ZERO
export var _to = Vector2.ZERO


func fx():
	return FxSetLerpValue.new(
			"position",
			ScalarRef.new(self, "_from"), 
			ScalarRef.new(self, "_to")
		)

