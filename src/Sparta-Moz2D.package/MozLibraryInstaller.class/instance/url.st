configuration
url
	|bits|
	bits := Smalltalk vm wordSize * 8.
	
	^ bits = 32
		ifTrue: [ self url32 ]
		ifFalse: [ bits = 64
			ifTrue: [ self url64 ]
			ifFalse: [ Error signal: 'Unknown platform ARCH: ', bits asString ] ]