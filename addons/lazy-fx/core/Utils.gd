class_name FxUtils
extends Reference


static func scalar_of(value):
	if value is Scalar:
		return value
	else:
		return ScalarFixed.new(value)

