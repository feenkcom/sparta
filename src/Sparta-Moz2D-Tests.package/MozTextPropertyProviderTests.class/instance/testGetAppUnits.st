tests
testGetAppUnits
	<expectedFailure>
	"bug in Alien callbacks.
	@see MozFFITest>>testCallbackUIntptr"

	| actualAppUnits |
	
	actualAppUnits := self primGetAppUnits: propertyProvider.

	self assert: actualAppUnits equals: propertyProvider appUnitsPerDevUnit