instance creation
fromString: aString
	^ self new
		initializeWith: (SpRope fromCollection: aString);
		yourself