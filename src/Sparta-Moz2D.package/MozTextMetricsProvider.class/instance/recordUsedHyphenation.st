advanced options
recordUsedHyphenation
	usedHyphenation := ExternalAddress allocate: (FFIBool externalTypeSize).
	usedHyphenation booleanAt: 1 put: false