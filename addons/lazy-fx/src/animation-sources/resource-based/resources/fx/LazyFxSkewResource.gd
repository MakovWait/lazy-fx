tool
class_name LazyFxSkewResource
extends Resource

export var _display_name = "skew"
export var _from = Vector2.ZERO
export var _to = Vector2.ZERO


func fx():
	return FxSetLerpValue.new(
			"material:shader_param/skew",
			ScalarRef.new(self, "_from"), 
			ScalarRef.new(self, "_to")
		)
