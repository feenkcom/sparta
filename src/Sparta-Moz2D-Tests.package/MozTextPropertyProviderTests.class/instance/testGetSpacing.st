tests
testGetSpacing
	| aSpacing helper aStart anEnd anExpected anActual anExternalArray |
	aSpacing := 20.0.
	aStart := 10.
	anEnd := 20. "without last, open interval"
	anExpected := Array new: (anEnd - aStart) * 2 withAll: aSpacing.
	
	helper := MozTextPropertyProviderTestsHelper new.
	helper spacing: aSpacing.
	propertyProvider metricsProvider: helper.
	
	anExternalArray := FFIExternalArray externalNewType: 'double' size: (anEnd - aStart) * 2.
	anExternalArray atAllPut: 0.
	
	self primGetSpacing: propertyProvider start: aStart end: anEnd array: anExternalArray getHandle.
	
	anActual := anExternalArray asArray.
	anExternalArray free.
	
	self assert: anActual equals: anExpected