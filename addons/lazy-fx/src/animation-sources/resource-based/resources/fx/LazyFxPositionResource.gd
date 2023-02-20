tool
class_name LazyFxPositionResource
extends Resource

export var _display_name = "position"
export(String, "x", "y") var _direction = "x" setget _set_direction
export var _from = 0.0
export var _to = 0.0

var _property_to_lerp = "position:x"


func fx():
	return FxSetLerpValue.new(
			ScalarRef.new(self, "_property_to_lerp"),
			ScalarRef.new(self, "_from"), 
			ScalarRef.new(self, "_to")
		)


func _set_direction(value):
	_direction = value
	_property_to_lerp = "position:%s" % value
