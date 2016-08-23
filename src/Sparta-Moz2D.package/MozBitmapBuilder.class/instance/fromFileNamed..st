instance creation
fromFileNamed: aString
	^ self fromForm: (ImageReadWriter formFromFileNamed: aString)