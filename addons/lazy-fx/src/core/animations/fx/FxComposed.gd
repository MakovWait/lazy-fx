class_name FxComposed
extends Reference


var _effects


func _init(effects):
	_effects = effects


func validate(target, errors):
	for effect in self._effects:
		effect.validate(target, errors)


func apply(target, x):
	for effect in self._effects:
		effect.apply(target, x)
