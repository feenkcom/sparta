advanced options
recordLastBreak
	lastBreak := ExternalAddress allocate: (FFIUInt32 externalTypeSize).
	lastBreak unsignedLongAt: 1 put: 4294967295 "uint32 maxValue"