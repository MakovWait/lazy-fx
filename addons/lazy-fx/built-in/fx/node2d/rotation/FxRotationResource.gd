tool
class_name FxRotationResource
extends Resource

export var _display_name = "rotation"
export var _from = 0.0
export var _to = 0.0


func fx():
	return FxRotation.new(
			ScalarRef.new(self, "_from"), 
			ScalarRef.new(self, "_to")
		)
