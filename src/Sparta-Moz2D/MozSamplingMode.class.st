Class {
	#name : #MozSamplingMode,
	#superclass : #MozEnum,
	#classVars : [
		'GOOD',
		'LINEAR',
		'POINT',
		'SENTINEL'
	],
	#category : 'Sparta-Moz2D-Enums'
}

{ #category : #'accessing enum' }
MozSamplingMode class >> GOOD [
	"This method was automatically generated"
	^ GOOD
]

{ #category : #'accessing enum' }
MozSamplingMode class >> LINEAR [
	"This method was automatically generated"
	^ LINEAR
]

{ #category : #'accessing enum' }
MozSamplingMode class >> POINT [
	"This method was automatically generated"
	^ POINT
]

{ #category : #'accessing enum' }
MozSamplingMode class >> SENTINEL [
	"This method was automatically generated"
	^ SENTINEL
]

{ #category : #'enum declaration' }
MozSamplingMode class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		GOOD 0
		LINEAR 1
		POINT 2
		SENTINEL 3
	)
]

{ #category : #accessing }
MozSamplingMode class >> externalEnum [
	^ #SamplingFilter
]

{ #category : #accessing }
MozSamplingMode class >> externalType [
	^ FFIInt8 new
]

{ #category : #'class initialization' }
MozSamplingMode class >> initialize [
	super initialize
]
