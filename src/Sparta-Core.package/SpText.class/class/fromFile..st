instance creation
fromFile: aFile
	^ self new
		initializeWith: (Rope fromFile: aFile);
		yourself