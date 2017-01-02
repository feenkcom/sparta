advanced options
recordTrimmedWhitespace
	trimWhitespace := ExternalAddress allocate: FFIFloat64 externalTypeSize.
	trimWhitespace doubleAt: 1 put: 0