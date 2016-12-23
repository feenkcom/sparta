instance creation
new
	| aHandle aPropertyProvider |
	aPropertyProvider := self basicNew.
	aHandle := self primCreate: aPropertyProvider identityHash.
	aPropertyProvider setHandle: aHandle.
	aPropertyProvider initialize.
	aPropertyProvider autoRelease.
	self instances at: aPropertyProvider identityHash put: aPropertyProvider.
	^ aPropertyProvider