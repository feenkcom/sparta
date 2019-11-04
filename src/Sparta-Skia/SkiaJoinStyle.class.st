Class {
	#name : #SkiaJoinStyle,
	#superclass : #SkiaExternalEnumeration,
	#classVars : [
		'Bevel',
		'Miter',
		'Round'
	],
	#category : #'Sparta-Skia-External'
}

{ #category : #'accessing enum' }
SkiaJoinStyle class >> Bevel [
	"This method was automatically generated"
	^ Bevel
]

{ #category : #'accessing enum' }
SkiaJoinStyle class >> Miter [
	"This method was automatically generated"
	^ Miter
]

{ #category : #'accessing enum' }
SkiaJoinStyle class >> Round [
	"This method was automatically generated"
	^ Round
]

{ #category : #'enum declaration' }
SkiaJoinStyle class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ #(
		Miter,
		Round,
		Bevel,
	)
]

{ #category : #accessing }
SkiaJoinStyle class >> externalType [
	^ FFIUInt8 new
]

{ #category : #'private - ffi' }
SkiaJoinStyle >> primRealName: aBoxerString [
	^ self ffiCall: #(void skia_enums_join_style_to_string(self, GtBoxerString aBoxerString))
]
