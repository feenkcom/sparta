testing
isValid
	^ session == Smalltalk session and: [
		handle isNull not ]