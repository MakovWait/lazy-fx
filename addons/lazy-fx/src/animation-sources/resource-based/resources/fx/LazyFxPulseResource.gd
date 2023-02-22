tool
class_name LazyFxPulseResource
extends Resource

export var _display_name = "pulse"
export var _color : Color = Color.white
export(float, 0.0, 1.0) var _from = 0.0
export(float, 0.0, 1.0) var _to = 0.0


func fx():
	return FxPulse.new(
			ScalarRef.new(self, "_from"), 
			ScalarRef.new(self, "_to"), 
			ScalarRef.new(self, "_color")
		)
