tests
testGetBreaks
	<expectedFailure> "bug in FFI"
	| aString aStart anEnd anExpected anActual anExternalArray |
	
	aString := 'Hel-lo world!'.
	aStart := 0.
	anEnd := aString size.

	anExpected := Array new: (anEnd - aStart) withAll: false.
	anExpected at: 5 put: true.
	anExpected at: 7 put: true.

	propertyProvider breakPriority: MozTextBreakPriority eNormalBreak.
	propertyProvider textRun: (MozTextRun fromString: aString).

	anExternalArray := FFIExternalArray externalNewType: 'bool' size: (anEnd - aStart).
	anExternalArray atAllPut: false.
	
	self primGetBreaks: propertyProvider start: aStart end: anEnd array: anExternalArray getHandle.
	
	anActual := anExternalArray asArray.
	anExternalArray free.
	
	self assert: anActual equals: anExpected