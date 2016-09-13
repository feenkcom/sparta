advanced options
recordTrimmedWhitespace
	trimWhitespace := ExternalAddress allocate: FFIFloat64 externalTypeSize.
	trimWhitespace autoRelease.
	trimWhitespace doubleAt: 1 put: 0