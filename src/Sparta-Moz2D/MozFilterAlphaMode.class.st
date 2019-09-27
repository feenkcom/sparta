Class {
	#name : #MozFilterAlphaMode,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'ALPHA_MODE_PREMULTIPLIED',
		'ALPHA_MODE_STRAIGHT'
	],
	#category : 'Sparta-Moz2D-Filters Enum'
}

{ #category : #'accessing enum' }
MozFilterAlphaMode class >> ALPHA_MODE_PREMULTIPLIED [
	"This method was automatically generated"
	^ ALPHA_MODE_PREMULTIPLIED
]

{ #category : #'accessing enum' }
MozFilterAlphaMode class >> ALPHA_MODE_STRAIGHT [
	"This method was automatically generated"
	^ ALPHA_MODE_STRAIGHT
]

{ #category : #'enum declaration' }
MozFilterAlphaMode class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		ALPHA_MODE_PREMULTIPLIED 0
		ALPHA_MODE_STRAIGHT 1
	)
]

{ #category : #'class initialization' }
MozFilterAlphaMode class >> initialize [
	self initializeEnumeration
]
