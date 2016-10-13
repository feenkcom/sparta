tests
testGetHyphenWidth
	| actualWidth |
	
	actualWidth := self primGetHyphenWidth: propertyProvider.

	self assert: actualWidth equals: propertyProvider hyphenWidth