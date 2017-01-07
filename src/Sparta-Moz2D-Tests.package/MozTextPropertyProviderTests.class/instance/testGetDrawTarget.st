tests
testGetDrawTarget
	| canvas actualCanvas |
	
	canvas := MozCanvas extent: 200@200.
	propertyProvider canvas: canvas.
	actualCanvas := self primGetDrawTarget: propertyProvider.

	self assert: actualCanvas getHandle value equals: canvas handle