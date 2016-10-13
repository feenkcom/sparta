preferences
export
	"transfers me to backend"
	| byteArray |
	byteArray := ((ZnCharacterEncoder newForEncoding: 'utf8')
		encodeString: key, Character null asString).
	self primExport: byteArray value: value