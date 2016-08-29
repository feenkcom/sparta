library
libraryArch
	|bits|
	bits := Smalltalk vm wordSize * 8.
	
	^ bits = 32
		ifTrue: [ 'i386' ]
		ifFalse: [ bits = 64
			ifTrue: [ 'x86_64' ]
			ifFalse: [ Error signal: 'Unknown platform ARCH: ', bits asString ] ]