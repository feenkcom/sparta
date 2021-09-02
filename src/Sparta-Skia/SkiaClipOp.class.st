Class {
	#name : 'SkiaClipOp',
	#superclass : 'SkiaExternalEnumeration',
	#classVars : [
		'Difference',
		'Intersect'
	],
	#category : 'Sparta-Skia-External'
}

{ #category : 'accessing enum' }
SkiaClipOp class >> Difference [
	"This method was automatically generated"
	^ Difference
]

{ #category : 'accessing enum' }
SkiaClipOp class >> Intersect [
	"This method was automatically generated"
	^ Intersect
]

{ #category : 'enum declaration' }
SkiaClipOp class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ #(
		Difference,
		Intersect,
	)
]

{ #category : 'accessing' }
SkiaClipOp class >> externalType [
	^ FFIInt32 new
]

{ #category : 'class initialization' }
SkiaClipOp class >> initialize [
	super initialize
]

{ #category : 'private - ffi' }
SkiaClipOp >> primRealName: aBoxerString [
	^ self ffiCall: #(void skia_enums_clip_op_to_string(self, GtBoxerString aBoxerString))
]
