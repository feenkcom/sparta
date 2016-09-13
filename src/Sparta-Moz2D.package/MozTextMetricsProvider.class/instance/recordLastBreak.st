advanced options
recordLastBreak
	lastBreak := ExternalAddress allocate: (FFIUInt32 externalTypeSize).
	lastBreak autoRelease.
	lastBreak unsignedLongAt: 1 put: SmallInteger maxVal