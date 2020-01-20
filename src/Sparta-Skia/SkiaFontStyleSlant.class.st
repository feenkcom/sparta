Class {
	#name : #SkiaFontStyleSlant,
	#superclass : #SkiaExternalEnumeration,
	#classVars : [
		'Italic',
		'Oblique',
		'Upright'
	],
	#classInstVars : [
		'Slants'
	],
	#category : #'Sparta-Skia-External'
}

{ #category : #'accessing enum' }
SkiaFontStyleSlant class >> Italic [
	"This method was automatically generated"
	^ Italic
]

{ #category : #'accessing enum' }
SkiaFontStyleSlant class >> Oblique [
	"This method was automatically generated"
	^ Oblique
]

{ #category : #'accessing enum' }
SkiaFontStyleSlant class >> Upright [
	"This method was automatically generated"
	^ Upright
]

{ #category : #'enum declaration' }
SkiaFontStyleSlant class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ #(
		Upright,
		Italic,
		Oblique,
	)
]

{ #category : #accessing }
SkiaFontStyleSlant class >> externalType [
	^ FFIInt32 new
]

{ #category : #'instance creation' }
SkiaFontStyleSlant class >> fromSpartaSlant: aSpartaFontSlant [
	Slants ifNil: [ Slants := {
		SpartaFontSlant normal -> self Upright.
		SpartaFontSlant italic -> self Italic.
		SpartaFontSlant oblique -> self Oblique
	} asDictionary ].
	
	^ Slants at: aSpartaFontSlant ifAbsent: [ self Upright ]
]

{ #category : #'class initialization' }
SkiaFontStyleSlant class >> initialize [
	super initialize.
]

{ #category : #'private - ffi' }
SkiaFontStyleSlant >> primRealName: aBoxerString [
	^ self ffiCall: #(void skia_enums_font_style_slant_to_string(self, GtBoxerString aBoxerString))
]
