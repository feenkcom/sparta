Class {
	#name : #MozUserFontSet,
	#superclass : #FFIExternalObject,
	#traits : 'TMozLibrary + TMozInlineRefPtr + TMozDebug + TSpUserFontSet',
	#classTraits : 'TMozLibrary classTrait + TMozInlineRefPtr classTrait + TMozDebug classTrait + TSpUserFontSet classTrait',
	#instVars : [
		'fontEntries'
	],
	#classInstVars : [
		'session',
		'empty',
		'default'
	],
	#category : #'Sparta-Moz2D-Text'
}

{ #category : #cleanup }
MozUserFontSet class >> cleanUp [
	super cleanUp.
	
	session := nil.
	empty := nil
]

{ #category : #'instance creation' }
MozUserFontSet class >> default [
	session == Smalltalk session
		ifFalse: [
			default := nil.
			session := Smalltalk session ].

	^ default ifNil: [ default := self new ]
]

{ #category : #'instance creation' }
MozUserFontSet class >> empty [
	session == Smalltalk session
		ifFalse: [
			empty := nil.
			session := Smalltalk session ].

	^ empty ifNil: [ empty := self new ]
]

{ #category : #'library path' }
MozUserFontSet class >> ffiLibraryName [
	^ MozLibrary
]

{ #category : #'instance creation' }
MozUserFontSet class >> new [	
	^ self primCreateFontUserSet
		initialize;
		autoRelease
]

{ #category : #'private - ffi' }
MozUserFontSet class >> primCreateFontUserSet [

	^ self ffiCall: #(MozUserFontSet moz2d_font_user_set_create())
]

{ #category : #'private - ffi' }
MozUserFontSet class >> primRelease: aHandle [

	^ self ffiCall: #( void moz2d_font_user_set_release ( void* aHandle ) )
]

{ #category : #adding }
MozUserFontSet >> add: aUserFontFace [
	| aFontEntry aBuffer aFontStyle |
	"Create and add a new font face from a source to a given family name"

	(self hasFontFace: aUserFontFace)
		ifTrue: [ ^ self ].

	aBuffer := aUserFontFace source fontContents.
	aBuffer pinInMemory.

	aFontStyle := MozFontStyle
		style: aUserFontFace style value
		weight: aUserFontFace weight value
		stretch: aUserFontFace stretch value.

	aFontEntry := self
		findOrCreateFontEntry: aUserFontFace familyName
		buffer: aBuffer
		style: aFontStyle.

	aFontEntry fontFace: aUserFontFace.
	aFontEntry buffer: aBuffer.

	self addFontEntry: aFontEntry
]

{ #category : #private }
MozUserFontSet >> addFontEntry: aFontEntry [

	self primAddFontEntry: aFontEntry named: aFontEntry name.
	
	fontEntries
		at: aFontEntry name
		ifPresent: [ :aSet | aSet add: aFontEntry ]
		ifAbsentPut: [ Set with: aFontEntry ]
]

{ #category : #private }
MozUserFontSet >> findOrCreateFontEntry: aFamilyName buffer: aBufferArray style: aMozFontStyle [
	| aFontEntry |
	
	aFontEntry := self
		primFindOrCreateFontEntry: aFamilyName
		buffer: aBufferArray
		length: aBufferArray size
		style: aMozFontStyle.

	aFontEntry autoRelease.
	aFontEntry load.

	^ aFontEntry
]

{ #category : #testing }
MozUserFontSet >> hasFamily: aFamilyName [
	<return: #Boolean>

	^ self primHasFamily: aFamilyName
]

{ #category : #testing }
MozUserFontSet >> hasFontFace: aUserFontFace [
	"Return true if I already contain a font face in a given family from provided source"
	<return: #Boolean>

	^ fontEntries
		at: aUserFontFace familyName
		ifPresent: [ :theFontEntries | theFontEntries anySatisfy: [ :aFontEntry | aFontEntry fontFace = aUserFontFace ] ]
		ifAbsent: [ false ]
]

{ #category : #'initialize-release' }
MozUserFontSet >> initialize [
	"dont send super to prevent ffi handle reset"
	
	fontEntries := Dictionary new
]

{ #category : #'private - ffi' }
MozUserFontSet >> primAddFontEntry: aUserFontEntry named: aFamilyName [

	^ self ffiCall: #(void moz2d_font_user_entry_add (
        self,
        String aFamilyName,
        MozUserFontEntry aUserFontEntry))
]

{ #category : #'private - ffi' }
MozUserFontSet >> primFindOrCreateFontEntry: aFamilyName buffer: aBufferArray length: aBufferLength style: aMozFontStyle [

	^ self ffiCall: #(MozUserFontEntry moz2d_font_user_find_or_create_user_font_entry(
		self,
		String aFamilyName,
		uint8* aBufferArray,
		uint32 aBufferLength,
		MozFontStyle aMozFontStyle))
]

{ #category : #'private - ffi' }
MozUserFontSet >> primHasFamily: aFamilyName [

	^ self ffiCall: #(bool moz2d_font_user_set_has_family (
        self,
        String aFamilyName))
]
