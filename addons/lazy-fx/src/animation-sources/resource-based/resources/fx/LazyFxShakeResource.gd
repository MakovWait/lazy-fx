tool
class_name LazyFxShakeResource
extends Resource


export var _display_name = "shake"
export var _intensity = 0.0
export var _smooth = 0.0
export var _rotational = 0.0


func fx():
	return FxShake.new(
			ScalarRef.new(self, "_intensity"), 
			ScalarRef.new(self, "_smooth"),
			ScalarRef.new(self, "_rotational")
		)
