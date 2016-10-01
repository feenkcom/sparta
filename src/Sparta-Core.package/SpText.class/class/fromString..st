instance creation
fromString: aString
	^ self new
		initializeWith: (Rope fromCollection: aString);
		yourself