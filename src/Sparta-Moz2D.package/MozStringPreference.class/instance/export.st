preferences
export
	"transfers me to backend"
	| byteArrayName byteArrayValue |
	byteArrayName := (ZnCharacterEncoder newForEncoding: 'utf8')
		encodeString: key, Character null asString.
	byteArrayValue := (ZnCharacterEncoder newForEncoding: 'utf8')
		encodeString: value, Character null asString.
	self primExport: byteArrayName value: byteArrayValue