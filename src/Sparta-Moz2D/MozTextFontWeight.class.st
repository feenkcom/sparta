Class {
	#name : #MozTextFontWeight,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'BLACK',
		'BOLD',
		'LIGHT',
		'MEDIUM',
		'NORMAL',
		'THIN'
	],
	#category : #'Sparta-Moz2D-Text-Enums'
}

{ #category : #'accessing enum' }
MozTextFontWeight class >> BLACK [
	"This method was automatically generated"
	^ BLACK
]

{ #category : #'accessing enum' }
MozTextFontWeight class >> BOLD [
	"This method was automatically generated"
	^ BOLD
]

{ #category : #'accessing enum' }
MozTextFontWeight class >> LIGHT [
	"This method was automatically generated"
	^ LIGHT
]

{ #category : #'accessing enum' }
MozTextFontWeight class >> MEDIUM [
	"This method was automatically generated"
	^ MEDIUM
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
		THIN 100
		LIGHT 300
		NORMAL 400
		MEDIUM 500
		BOLD 700
		BLACK 900
	)
]

{ #category : #'class initialization' }
MozTextFontWeight class >> initialize [
	self initializeEnumeration
]
