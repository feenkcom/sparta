accessing
fontNames
	| lengthValue externalArray length names|
	lengthValue := ByteArray new: FFIUInt32 externalTypeSize.
	lengthValue integerAt: 1 put: 0 size: FFIUInt32 externalTypeSize signed: false.
	
	"No auto release, will free at the end"
	externalArray := self primGetFontList: lengthValue.
	length := lengthValue integerAt: 1 size: FFIUInt32 externalTypeSize signed: false.
	externalArray initializeHandle: externalArray getHandle getHandle type: (externalArray class resolveType: MozFontFamilyName) size: length.
	"Auto release font names. We get copies and not actual references, so it is our responsibility to free memory"
	names := externalArray collect: [ :each | (MozFontFamilyName fromHandle: each) autoRelease ] as: Array.
	externalArray free.
	^ names