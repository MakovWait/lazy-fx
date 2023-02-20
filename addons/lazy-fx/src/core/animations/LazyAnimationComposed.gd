class_name LazyAnimationComposed
extends Reference


var _origins


func _init(origins):
	self._origins = origins


func validate(target, errors):
	for x in self._origins:
		x.validate(target, errors)


func play(target, time):
	for x in self._origins:
		x.play(target, time)
