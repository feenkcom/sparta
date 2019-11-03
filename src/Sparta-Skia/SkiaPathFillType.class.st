Class {
	#name : #SkiaPathFillType,
	#superclass : #SkiaExternalEnumeration,
	#classVars : [
		'EvenOdd',
		'InverseEvenOdd',
		'InverseWinding',
		'Winding'
	],
	#category : #'Sparta-Skia-External'
}

{ #category : #'accessing enum' }
SkiaPathFillType class >> EvenOdd [
	"This method was automatically generated"
	^ EvenOdd
]

{ #category : #'accessing enum' }
SkiaPathFillType class >> InverseEvenOdd [
	"This method was automatically generated"
	^ InverseEvenOdd
]

{ #category : #'accessing enum' }
SkiaPathFillType class >> InverseWinding [
	"This method was automatically generated"
	^ InverseWinding
]

{ #category : #'accessing enum' }
SkiaPathFillType class >> Winding [
	"This method was automatically generated"
	^ Winding
]

{ #category : #'enum declaration' }
SkiaPathFillType class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ #(
		Winding,
		EvenOdd,
		InverseWinding,
		InverseEvenOdd,
	)
]

{ #category : #accessing }
SkiaPathFillType class >> externalType [
	^ FFIInt32 new
]

{ #category : #'private - ffi' }
SkiaPathFillType >> primRealName: aBoxerString [
	^ self ffiCall: #(void skia_enums_path_fill_type_to_string(self, GtBoxerString aBoxerString))
]
