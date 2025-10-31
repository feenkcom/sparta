Class {
	#name : #SkiaFontEdging,
	#superclass : #SkiaExternalEnumeration,
	#classVars : [
		'Alias',
		'AntiAlias',
		'SubpixelAntiAlias'
	],
	#category : #'Sparta-Skia-External'
}

{ #category : #'accessing enum' }
SkiaFontEdging class >> Alias [
	"This method was automatically generated"
	^ Alias
]

{ #category : #'accessing enum' }
SkiaFontEdging class >> AntiAlias [
	"This method was automatically generated"
	^ AntiAlias
]

{ #category : #'accessing enum' }
SkiaFontEdging class >> SubpixelAntiAlias [
	"This method was automatically generated"
	^ SubpixelAntiAlias
]

{ #category : #'enum declaration' }
SkiaFontEdging class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ #(
		Alias,
		AntiAlias,
		SubpixelAntiAlias,
	)
]

{ #category : #accessing }
SkiaFontEdging class >> externalType [
	^ FFIInt32 new
]

{ #category : #'class initialization' }
SkiaFontEdging class >> initialize [
	super initialize
]

{ #category : #'private - ffi' }
SkiaFontEdging >> primRealName: aBoxerString [
	^ self ffiCall: #(void skia_enums_font_edging_to_string(self, GtBoxerString aBoxerString))
]
