Class {
	#name : #SkiaFontStyleSlant,
	#superclass : #SkiaExternalEnumeration,
	#classVars : [
		'Italic',
		'Oblique',
		'Upright'
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

{ #category : #'class initialization' }
SkiaFontStyleSlant class >> initialize [
	super initialize
]

{ #category : #converting }
SkiaFontStyleSlant >> asSpartaFontSlant [
	self = Upright
		ifTrue: [ ^ SpartaFontSlant normal ].

	self = Italic
		ifTrue: [ ^ SpartaFontSlant italic ].
		
	self == Oblique
		ifTrue: [ ^ SpartaFontSlant oblique ].
		
	^ SpartaFontSlant normal
]

{ #category : #'private - ffi' }
SkiaFontStyleSlant >> primRealName: aBoxerString [
	^ self ffiCall: #(void skia_enums_font_style_slant_to_string(self, GtBoxerString aBoxerString))
]
