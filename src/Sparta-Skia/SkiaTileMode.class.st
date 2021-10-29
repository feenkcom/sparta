Class {
	#name : #SkiaTileMode,
	#superclass : #SkiaExternalEnumeration,
	#classVars : [
		'Clamp',
		'Decal',
		'Mirror',
		'Repeat'
	],
	#category : 'Sparta-Skia-External'
}

{ #category : #'accessing enum' }
SkiaTileMode class >> Clamp [
	"This method was automatically generated"
	^ Clamp
]

{ #category : #'accessing enum' }
SkiaTileMode class >> Decal [
	"This method was automatically generated"
	^ Decal
]

{ #category : #'accessing enum' }
SkiaTileMode class >> Mirror [
	"This method was automatically generated"
	^ Mirror
]

{ #category : #'accessing enum' }
SkiaTileMode class >> Repeat [
	"This method was automatically generated"
	^ Repeat
]

{ #category : #'enum declaration' }
SkiaTileMode class >> externalDeclaration [
	"
	self rebuildEnumAccessors
	"

	^ #(
		Clamp,
		Repeat,
		Mirror,
		Decal,
	)
]

{ #category : #accessing }
SkiaTileMode class >> externalType [
	^ FFIInt32 new
]

{ #category : #'class initialization' }
SkiaTileMode class >> initialize [
	super initialize
]

{ #category : #'private - ffi' }
SkiaTileMode >> primRealName: aBoxerString [
	^ self ffiCall: #(void skia_enums_tile_mode_to_string(self, GtBoxerString aBoxerString))
]
