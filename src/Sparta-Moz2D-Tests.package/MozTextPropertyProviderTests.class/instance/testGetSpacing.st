tests
testGetSpacing
	| aSpacing aStart anEnd anExpected anActual anExternalArray |
	aSpacing := 20.0.
	aStart := 10.
	anEnd := 20. "without last, open interval"
	anExpected := Array new: (anEnd - aStart) * 2 withAll: 0.
	anExpected withIndexDo: [ :each :index |
		index % 2 = 0
			ifTrue: [ anExpected at: index put: aSpacing ] ].
	
	propertyProvider spacing: aSpacing.
	
	anExternalArray := FFIExternalArray externalNewType: 'double' size: (anEnd - aStart) * 2.
	anExternalArray atAllPut: 0.
	
	self primGetSpacing: propertyProvider start: aStart end: anEnd array: anExternalArray getHandle.
	
	anActual := anExternalArray asArray.
	anExternalArray free.
	
	self assert: anActual equals: anExpected