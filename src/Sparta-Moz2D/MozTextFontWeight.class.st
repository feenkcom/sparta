Class {
	#name : #MozTextFontWeight,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'BOLD',
		'NORMAL',
		'THIN'
	],
	#category : 'Sparta-Moz2D-Text-Enums'
}

{ #category : #'accessing enum' }
MozTextFontWeight class >> BOLD [
	"This method was automatically generated"
	^ BOLD
]

{ #category : #'accessing enum' }
MozTextFontWeight class >> NORMAL [
	"This method was automatically generated"
	^ NORMAL
]

{ #category : #'accessing enum' }
MozTextFontWeight class >> THIN [
	"This method was automatically generated"
	^ THIN
]

{ #category : #'enum declaration' }
MozTextFontWeight class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		NORMAL 400
		BOLD 700
		THIN 100
	)
]

{ #category : #'class initialization' }
MozTextFontWeight class >> initialize [
	self initializeEnumeration
]
