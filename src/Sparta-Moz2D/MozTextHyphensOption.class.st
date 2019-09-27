Class {
	#name : #MozTextHyphensOption,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'AUTO',
		'MANUAL',
		'NONE'
	],
	#category : 'Sparta-Moz2D-Text-Enums'
}

{ #category : #'accessing enum' }
MozTextHyphensOption class >> AUTO [
	"This method was automatically generated"
	^ AUTO
]

{ #category : #'accessing enum' }
MozTextHyphensOption class >> MANUAL [
	"This method was automatically generated"
	^ MANUAL
]

{ #category : #'accessing enum' }
MozTextHyphensOption class >> NONE [
	"This method was automatically generated"
	^ NONE
]

{ #category : #'enum declaration' }
MozTextHyphensOption class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		NONE   0
		MANUAL 1
		AUTO   2
	)
]

{ #category : #'class initialization' }
MozTextHyphensOption class >> initialize [
	self initializeEnumeration.
	representationType := FFIInt8 new
]
