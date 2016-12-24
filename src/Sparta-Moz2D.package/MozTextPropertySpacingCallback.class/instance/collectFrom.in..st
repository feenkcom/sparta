properties
collectFrom: aPropertyProvider in: aPropertyCollector
	| aStart anEnd aHandle anArray |
	
	aHandle := self primGetSpacing: aPropertyCollector.
	aStart := self primGetStart: aPropertyCollector.
	anEnd := self primGetEnd: aPropertyCollector.
	
	anArray := FFIExternalArray fromHandle: aHandle getHandle type: 'double' size: (anEnd - aStart) * 2.
	aPropertyProvider spacingWithin: (aStart + 1 to: anEnd) in: anArray.