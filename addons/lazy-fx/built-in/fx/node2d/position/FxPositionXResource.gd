tool
class_name FxPositionXResource
extends Resource

export var _display_name = "position:x"
export var _from = 0.0
export var _to = 0.0


func fx():
	return FxPositionX.new(
			ScalarRef.new(self, "_from"), 
			ScalarRef.new(self, "_to")
		)
