collection api
add: aFontFamilyNameOrTypeOrString
	
	aFontFamilyNameOrTypeOrString isString
		ifTrue: [ self primAppendFontFamilyNamed: aFontFamilyNameOrTypeOrString ]
		ifFalse: [ (aFontFamilyNameOrTypeOrString isKindOf: FFIExternalEnumeration)
			ifTrue: [ self primAppendFontFamilyGeneric: aFontFamilyNameOrTypeOrString ]
			ifFalse: [ (aFontFamilyNameOrTypeOrString isKindOf: FFIExternalObject)
				ifTrue: [ self primAppendFontFamilyName: aFontFamilyNameOrTypeOrString ]
				ifFalse: [ self error: 'You can only add named, of generic type or font family name object' ] ] ]