Class {
	#name : #SkiaAlphaType,
	#superclass : #SkiaExternalEnumeration,
	#classVars : [
		'Opaque',
		'Premul',
		'Unknown',
		'Unpremul'
	],
	#category : 'Sparta-Skia-External'
}

{ #category : #'accessing enum' }
SkiaAlphaType class >> Opaque [
	"This method was automatically generated"
	^ Opaque
]

{ #category : #'accessing enum' }
SkiaAlphaType class >> Premul [
	"This method was automatically generated"
	^ Premul
]

{ #category : #'accessing enum' }
SkiaAlphaType class >> Unknown [
	"This method was automatically generated"
	^ Unknown
]

{ #category : #'accessing enum' }
SkiaAlphaType class >> Unpremul [
	"This method was automatically generated"
	^ Unpremul
]

{ #category : #'enum declaration' }
SkiaAlphaType class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ #(
		Unknown,
		Opaque,
		Premul,
		Unpremul,
	)
]

{ #category : #accessing }
SkiaAlphaType class >> externalType [
	^ FFIInt32 new
]

{ #category : #'class initialization' }
SkiaAlphaType class >> initialize [
	super initialize
]

{ #category : #'private - ffi' }
SkiaAlphaType >> primRealName: aBoxerString [
	^ self ffiCall: #(void skia_enums_alpha_type_to_string(self, GtBoxerString aBoxerString))
]
