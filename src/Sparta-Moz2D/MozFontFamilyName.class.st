"
I represent a font family name, a string for the name if not a generic and a font type indicated named family or which generic family.

Generic types are:
	serif, sans-serif, monospace, cursive, fantasy.
	
Examples:

Named font family name:
	MozFontFamilyName named: 'Arial'

Generic font family name:
	MozFontFamilyName generic: MozFontFamilyType sansSerif
"
Class {
	#name : #MozFontFamilyName,
	#superclass : #FFIExternalObject,
	#traits : 'TMozLibrary + TMozPlainPtr + TMozDebug',
	#classTraits : 'TMozLibrary classTrait + TMozPlainPtr classTrait + TMozDebug classTrait',
	#category : 'Sparta-Moz2D-Text'
}

{ #category : #'instance creation' }
MozFontFamilyName class >> generic: aMozFontFamilyType [
	"Creates a generic family name, e.g sans-serif, serif
	@see MozFontFamilyType enum"
	^ (self primCreateGeneric: aMozFontFamilyType)
			autoRelease;
			yourself
]

{ #category : #'instance creation' }
MozFontFamilyName class >> named: aFontNameString [
	"Default constructor. When printed will not have quotes around"
	^ (self
		primCreateNamed: aFontNameString
		quoted: false)
			autoRelease;
			yourself
]

{ #category : #'private - ffi' }
MozFontFamilyName class >> primCreateGeneric: aType [

	^ self ffiCall: #(MozFontFamilyName moz2d_font_family_name_create_generic(MozFontFamilyType aType))
]

{ #category : #'private - ffi' }
MozFontFamilyName class >> primCreateNamed: aFamilyName quoted: aQuoted [

	^ self ffiCall: #(MozFontFamilyName moz2d_font_family_name_create_named_utf8(char* aFamilyName, bool aQuoted))
]

{ #category : #'private - ffi' }
MozFontFamilyName class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	^ self ffiCall: #(void moz2d_font_family_name_delete (void* aHandle))
]

{ #category : #printing }
MozFontFamilyName >> asString [

	^ self primToStringQuotes: true
]

{ #category : #testing }
MozFontFamilyName >> isGeneric [

	^ self primIsGeneric
]

{ #category : #testing }
MozFontFamilyName >> isNamed [

	^ self primIsNamed
]

{ #category : #accessing }
MozFontFamilyName >> name [

	^ self primGetName
]

{ #category : #'private - ffi' }
MozFontFamilyName >> primGetName [

	^ self ffiCall: #(char* moz2d_font_family_name_get_name (self))
]

{ #category : #'private - ffi' }
MozFontFamilyName >> primGetType [

	^ self ffiCall: #(MozFontFamilyType moz2d_font_family_name_get_type (self))
]

{ #category : #'private - ffi' }
MozFontFamilyName >> primIsGeneric [

	^ self ffiCall: #(bool moz2d_font_family_name_is_generic (self))
]

{ #category : #'private - ffi' }
MozFontFamilyName >> primIsNamed [

	^ self ffiCall: #(bool moz2d_font_family_name_is_named (self))
]

{ #category : #'private - ffi' }
MozFontFamilyName >> primToStringQuotes: withQuotes [
	"withQuotes is a boolean"
	
	^ self ffiCall: #(char* moz2d_font_family_name_to_string (self, bool withQuotes))
]

{ #category : #printing }
MozFontFamilyName >> printOn: aStream [

	aStream nextPutAll: self class name, ' ('; cr.
	aStream tab; nextPutAll: 'name: ', self name; cr.
	aStream tab; nextPutAll: 'type: ', self type item asString; cr.
	aStream tab; nextPutAll: 'named: ', self isNamed asString; cr.
	aStream tab; nextPutAll: 'generic: ', self isGeneric asString; cr.
	aStream tab; nextPutAll: 'string: ', self asString; space.
	aStream nextPutAll: ')'; cr.
]

{ #category : #accessing }
MozFontFamilyName >> type [

	^ self primGetType
]
