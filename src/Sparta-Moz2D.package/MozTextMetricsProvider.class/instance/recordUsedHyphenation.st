advanced options
recordUsedHyphenation
	usedHyphenation := ExternalAddress allocate: (FFIBool externalTypeSize).
	usedHyphenation autoRelease.
	usedHyphenation booleanAt: 1 put: false