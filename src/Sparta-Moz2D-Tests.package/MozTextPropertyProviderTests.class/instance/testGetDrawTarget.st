tests
testGetDrawTarget
	| helper canvas actualCanvas |
	canvas := MozCanvas extent: 200@200.
	helper := MozTextPropertyProviderTestsHelper new.
	helper canvas: canvas.
	
	propertyProvider metricsProvider: helper.
	actualCanvas := self primGetDrawTarget: propertyProvider.

	self assert: actualCanvas getHandle value equals: canvas handle