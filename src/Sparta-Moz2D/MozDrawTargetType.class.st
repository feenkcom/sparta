Class {
	#name : #MozDrawTargetType,
	#superclass : #MozEnum,
	#classVars : [
		'HARDWARE_RASTER',
		'SOFTWARE_RASTER',
		'VECTOR'
	],
	#category : 'Sparta-Moz2D-Enums'
}

{ #category : #'accessing enum' }
MozDrawTargetType class >> HARDWARE_RASTER [
	"This method was automatically generated"
	^ HARDWARE_RASTER
]

{ #category : #'accessing enum' }
MozDrawTargetType class >> SOFTWARE_RASTER [
	"This method was automatically generated"
	^ SOFTWARE_RASTER
]

{ #category : #'accessing enum' }
MozDrawTargetType class >> VECTOR [
	"This method was automatically generated"
	^ VECTOR
]

{ #category : #'enum declaration' }
MozDrawTargetType class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		SOFTWARE_RASTER 0
  		HARDWARE_RASTER 1
  		VECTOR 2
	)
]

{ #category : #accessing }
MozDrawTargetType class >> externalEnum [
	^ 'DrawTargetType'
]

{ #category : #accessing }
MozDrawTargetType class >> externalType [
	^ FFIInt8 new
]

{ #category : #'class initialization' }
MozDrawTargetType class >> initialize [
	super initialize
]
