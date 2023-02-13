tool
class_name FxPulseResource
extends Resource

export var _display_name = "pulse"
export var _color : Color = Color.white
export(float, 0.0, 1.0) var _intensity = 0.0


func fx():
	return FxPulse.new(
			ScalarRef.new(self, "_intensity"), 
			ScalarRef.new(self, "_color")
		)
