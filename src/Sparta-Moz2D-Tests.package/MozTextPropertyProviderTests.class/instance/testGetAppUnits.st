tests
testGetAppUnits
	| actualAppUnits |
	
	actualAppUnits := self primGetAppUnits: propertyProvider.

	self assert: actualAppUnits equals: propertyProvider appUnitsPerDevUnit