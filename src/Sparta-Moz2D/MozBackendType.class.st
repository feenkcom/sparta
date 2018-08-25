Class {
	#name : #MozBackendType,
	#superclass : #MozEnum,
	#classVars : [
		'CAIRO',
		'DIRECT2D',
		'DIRECT2D1_1',
		'NONE',
		'RECORDING',
		'SKIA'
	],
	#category : 'Sparta-Moz2D-Enums'
}

{ #category : #'accessing enum' }
MozBackendType class >> CAIRO [
	"This method was automatically generated"
	^ CAIRO
]

{ #category : #'accessing enum' }
MozBackendType class >> DIRECT2D [
	"This method was automatically generated"
	^ DIRECT2D
]

{ #category : #'accessing enum' }
MozBackendType class >> DIRECT2D1_1 [
	"This method was automatically generated"
	^ DIRECT2D1_1
]

{ #category : #'accessing enum' }
MozBackendType class >> NONE [
	"This method was automatically generated"
	^ NONE
]

{ #category : #'accessing enum' }
MozBackendType class >> RECORDING [
	"This method was automatically generated"
	^ RECORDING
]

{ #category : #'accessing enum' }
MozBackendType class >> SKIA [
	"This method was automatically generated"
	^ SKIA
]

{ #category : #'enum declaration' }
MozBackendType class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		NONE 0
		DIRECT2D 1 "Used for version independent D2D objects."
		CAIRO 2
		SKIA 3
		RECORDING 4
		DIRECT2D1_1 5
	)
]

{ #category : #accessing }
MozBackendType class >> externalEnum [
	^ #BackendType
]

{ #category : #accessing }
MozBackendType class >> externalType [
	^ FFIInt8 new
]

{ #category : #'class initialization' }
MozBackendType class >> initialize [
	super initialize
]
