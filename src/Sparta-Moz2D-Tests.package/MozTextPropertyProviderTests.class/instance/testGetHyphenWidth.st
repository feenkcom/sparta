tests
testGetHyphenWidth
	| actualWidth |
	
	actualWidth := self primGetHyphenWidth: propertyProvider.

	self assert: (actualWidth - propertyProvider hyphenWidth) abs < 0.000001