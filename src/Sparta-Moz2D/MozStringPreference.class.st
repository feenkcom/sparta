Class {
	#name : #MozStringPreference,
	#superclass : #MozPreference,
	#category : 'Sparta-Moz2D-Preferences'
}

{ #category : #preferences }
MozStringPreference >> export [
	"transfers me to backend"
	| byteArrayName byteArrayValue |
	byteArrayName := (ZnCharacterEncoder newForEncoding: 'utf8')
		encodeString: key, Character null asString.
	byteArrayValue := (ZnCharacterEncoder newForEncoding: 'utf8')
		encodeString: value, Character null asString.
	self primExport: byteArrayName value: byteArrayValue
]

{ #category : #preferences }
MozStringPreference >> primExport: aName value: aValue [

	^ self ffiCall: #(void moz_preferences_set_string (short* aName, short* aValue))
]
