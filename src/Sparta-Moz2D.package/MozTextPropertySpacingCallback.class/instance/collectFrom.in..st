properties
collectFrom: aPropertyProvider in: aPropertyCollector
	| aStart anEnd aHandle spacing array |
	
	aHandle := self primGetSpacing: aPropertyCollector.
	aStart := self primGetStart: aPropertyCollector.
	anEnd := self primGetEnd: aPropertyCollector.
	
	array := FFIExternalArray fromHandle: aHandle getHandle type: 'double' size: (anEnd - aStart) * 2.
	spacing := aPropertyProvider spacingIn: (aStart + 1 to: anEnd).
	array atAll: (1 to: spacing size) putAll: spacing