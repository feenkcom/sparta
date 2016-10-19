instance creation
fromFile: aFile
	^ self new
		initializeWith: (SpRope fromFile: aFile);
		yourself