properties
collectFrom: aPropertyProvider in: aPropertyCollector
	| aStart anEnd aHandle theBreaks anArray |
	
	aHandle := self primGetBreaks: aPropertyCollector.
	aStart := self primGetStart: aPropertyCollector.
	anEnd := self primGetEnd: aPropertyCollector.

	anArray := FFIExternalArray fromHandle: aHandle getHandle type: FFIBool size: (anEnd - aStart).
	theBreaks := aPropertyProvider hyphenationBreaksWithin: (aStart + 1 to: anEnd).
	
	anArray atAll: (1 to: theBreaks size) putAll: theBreaks