accessing
preferences
	| rawPreferences aLengthValue aLength aPreferences |
	aLengthValue := ByteArray new: FFIUInt32 externalTypeSize.
	aLengthValue integerAt: 1 put: 0 size: FFIUInt32 externalTypeSize signed: false.
	"We get a reference to array, no need to free"
	rawPreferences := self primAllPreferences: aLengthValue.
	aLength := aLengthValue integerAt: 1 size: FFIUInt32 externalTypeSize signed: false.
	rawPreferences initializeHandle: rawPreferences getHandle getHandle type: (rawPreferences class resolveType: MozGfxPreference) size: aLength.
	"we et reference to MozGfxPreference, no need to free"
	aPreferences := rawPreferences collect: [ :each | (MozGfxPreference fromHandle: each) ] as: Array.
	^ aPreferences