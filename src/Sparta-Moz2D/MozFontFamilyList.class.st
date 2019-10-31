"
I represent a font family list, array of font families and a default font type.
Font family names are either named strings or generics.
The default font type is used to preserve the variable font fallback behavior

Examples:

Empty family list with none default font type:
	MozFontFamilyList empty
	
Empty family list with specified default font type:
	MozFontFamilyList default: MozFontFamilyType sansSerif
	
Add named font family:
	MozFontFamilyList empty add: 'Arial'

Add generic font family:
	MozFontFamilyList empty add: MozFontFamilyType sansSerif
	
Add font family name object (will add a copy of it):
	MozFontFamilyList empty add: (MozFontFamilyName named: 'Helvetica')
	
Get an array of all font family name objects (returns a copies):
	list fontNames
"
Class {
	#name : #MozFontFamilyList,
	#superclass : #FFIExternalObject,
	#traits : 'TMozLibrary + TMozPlainPtr + TMozDebug',
	#classTraits : 'TMozLibrary classTrait + TMozPlainPtr classTrait + TMozDebug classTrait',
	#category : 'Sparta-Moz2D-Text'
}

{ #category : #'instance creation' }
MozFontFamilyList class >> default: aFontFamilyType [

	^ self empty
		defaultFontType: aFontFamilyType;
		yourself
]

{ #category : #'instance creation' }
MozFontFamilyList class >> empty [
	^ self primCreateDefault
		autoRelease;
		yourself
]

{ #category : #'instance creation' }
MozFontFamilyList class >> generic: aMozFontFamilyType [
	"Creates a font list with one generic family name, e.g sans-serif, serif
	@see MozFontFamilyType enum"
	^ (self primCreateGeneric: aMozFontFamilyType)
		autoRelease;
		yourself
]

{ #category : #'instance creation' }
MozFontFamilyList class >> named: aFontNameString [

	^ (self
		primCreateNamed: aFontNameString
		quoted: false)
			autoRelease;
			yourself
]

{ #category : #'instance creation' }
MozFontFamilyList class >> names: aListOfStrings [

	^ self empty
		in: [ :list | aListOfStrings do: [ :each | list add: each ] ];
		yourself
]

{ #category : #'private - ffi' }
MozFontFamilyList class >> primCreateDefault [
	^ self ffiCall: #(MozFontFamilyList moz2d_font_family_list_create())
]

{ #category : #'private - ffi' }
MozFontFamilyList class >> primCreateGeneric: aMozFontFamilyType [

	^ self ffiCall: #(MozFontFamilyList moz2d_font_family_list_create_generic(MozFontFamilyType aMozFontFamilyType))
]

{ #category : #'private - ffi' }
MozFontFamilyList class >> primCreateNamed: aFontFamilyName quoted: aQuoted [
	"aQuoted is a boolean"

	^ self ffiCall: #(MozFontFamilyList moz2d_font_family_list_create_named_utf8(char* aFontFamilyName, bool aQuoted))
]

{ #category : #'private - ffi' }
MozFontFamilyList class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	^ self ffiCall: #(void moz2d_font_family_list_delete(void* aHandle))
]

{ #category : #'collection api' }
MozFontFamilyList >> add: aFontFamilyNameOrTypeOrString [
	
	aFontFamilyNameOrTypeOrString isString
		ifTrue: [ self primAppendFontFamilyNamed: aFontFamilyNameOrTypeOrString ]
		ifFalse: [ (aFontFamilyNameOrTypeOrString isKindOf: FFIExternalEnumeration)
			ifTrue: [ self primAppendFontFamilyGeneric: aFontFamilyNameOrTypeOrString ]
			ifFalse: [ (aFontFamilyNameOrTypeOrString isKindOf: FFIExternalObject)
				ifTrue: [ self primAppendFontFamilyName: aFontFamilyNameOrTypeOrString ]
				ifFalse: [ self error: 'You can only add named, of generic type or font family name object' ] ] ]
]

{ #category : #printing }
MozFontFamilyList >> asString [

	^ self
		primToStringQuotes: false
		includeDefault: true
]

{ #category : #'collection api' }
MozFontFamilyList >> collect: aBlock [
	^ self fontNames collect: aBlock
]

{ #category : #accessing }
MozFontFamilyList >> defaultFontType [

	^ self primGetDefaultFontType
]

{ #category : #accessing }
MozFontFamilyList >> defaultFontType: aFontFamilyType [
	"A default font type can be either none, serif or sans-serif!"
	self assert: [  aFontFamilyType = MozFontFamilyType none
		or: [ aFontFamilyType = MozFontFamilyType serif
			or: [ aFontFamilyType = MozFontFamilyType sansSerif ] ] ]
		description: 'Can only be none, serif or sans-serif'.
		
	self primSetDefaultFontType: aFontFamilyType
]

{ #category : #'collection api' }
MozFontFamilyList >> do: aBlock [
	self fontNames do: aBlock
]

{ #category : #accessing }
MozFontFamilyList >> fontNames [
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
]

{ #category : #testing }
MozFontFamilyList >> isEmpty [
	^ self size = 0
]

{ #category : #'private - ffi' }
MozFontFamilyList >> primAppendFontFamilyGeneric: aFontFamilyType [

	^ self ffiCall: #(void moz2d_font_family_list_append_family_generic(self, MozFontFamilyType aFontFamilyType))
]

{ #category : #'private - ffi' }
MozFontFamilyList >> primAppendFontFamilyName: aFontFamilyName [

	^ self ffiCall: #(void moz2d_font_family_list_append_family_name(self, MozFontFamilyName aFontFamilyName))
]

{ #category : #'private - ffi' }
MozFontFamilyList >> primAppendFontFamilyNamed: aFontFamilyNameString [

	^ self ffiCall: #(void moz2d_font_family_list_append_family_named_utf8(self, char* aFontFamilyNameString))
]

{ #category : #'private - ffi' }
MozFontFamilyList >> primClear [

	^ self ffiCall: #(void moz2d_font_family_list_clear(self))
]

{ #category : #'private - ffi' }
MozFontFamilyList >> primGetDefaultFontType [

	^ self ffiCall: #(MozFontFamilyType moz2d_font_family_list_get_default_font_type(self))
]

{ #category : #'private - ffi' }
MozFontFamilyList >> primGetFontList: aReturnLength [

	^ self ffiCall: #(FFIExternalArray moz2d_font_family_list_get_font_list(self, uint32* aReturnLength))
]

{ #category : #'private - ffi' }
MozFontFamilyList >> primLength [

	^ self ffiCall: #(size_t moz2d_font_family_list_length(self))
]

{ #category : #'private - ffi' }
MozFontFamilyList >> primSetDefaultFontType: aFontType [

	^ self ffiCall: #(void moz2d_font_family_list_set_default_font_type(self, MozFontFamilyType aFontType))
]

{ #category : #'private - ffi' }
MozFontFamilyList >> primToStringQuotes: withQuotes includeDefault: includeDefault [

	^ self ffiCall: #(char* moz2d_font_family_list_to_string(self, bool withQuotes, bool includeDefault))
]

{ #category : #printing }
MozFontFamilyList >> printOn: aStream [
	aStream nextPutAll: self class name; nextPutAll: ' ('.

	self isNull
		ifFalse: [
			aStream cr.
			aStream tab; nextPutAll: 'fonts: '; nextPutAll: self asString; cr.
			aStream tab; nextPutAll: 'size: '; nextPutAll: self size asString; cr.
			aStream tab; nextPutAll: 'default: '; nextPutAll: self defaultFontType item asString; cr ]
		ifTrue: [ aStream nextPutAll: 'nil' ].
	aStream nextPutAll: ')'; cr
]

{ #category : #'collection api' }
MozFontFamilyList >> removeAll [

	self primClear
]

{ #category : #'collection api' }
MozFontFamilyList >> select: aBlock [
	^ self fontNames select: aBlock
]

{ #category : #accessing }
MozFontFamilyList >> size [
	^ self primLength
]
