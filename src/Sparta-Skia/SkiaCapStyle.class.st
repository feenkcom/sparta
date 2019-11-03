Class {
	#name : #SkiaCapStyle,
	#superclass : #SkiaExternalEnumeration,
	#classVars : [
		'Butt',
		'Round',
		'Square'
	],
	#category : #'Sparta-Skia-External'
}

{ #category : #'accessing enum' }
SkiaCapStyle class >> Butt [
	"This method was automatically generated"
	^ Butt
]

{ #category : #'accessing enum' }
SkiaCapStyle class >> Round [
	"This method was automatically generated"
	^ Round
]

{ #category : #'accessing enum' }
SkiaCapStyle class >> Square [
	"This method was automatically generated"
	^ Square
]

{ #category : #'enum declaration' }
SkiaCapStyle class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ #(
		Butt,
		Round,
		Square,
	)
]

{ #category : #accessing }
SkiaCapStyle class >> externalType [
	^ FFIInt32 new
]

{ #category : #'private - ffi' }
SkiaCapStyle >> primRealName: aBoxerString [
	^ self ffiCall: #(void skia_enums_cap_style_string(self, GtBoxerString aBoxerString))
]
