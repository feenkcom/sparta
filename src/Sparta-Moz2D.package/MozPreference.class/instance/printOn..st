printing
printOn: aStream

	aStream
		nextPutAll: self value printString;
		yourself