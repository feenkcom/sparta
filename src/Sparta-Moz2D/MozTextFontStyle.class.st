Class {
	#name : #MozTextFontStyle,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'ITALIC',
		'NORMAL',
		'OBLIQUE',
		'Styles'
	],
	#category : #'Sparta-Moz2D-Text-Enums'
}

{ #category : #'accessing enum' }
MozTextFontStyle class >> ITALIC [
	"This method was automatically generated"
	^ ITALIC
]

{ #category : #'accessing enum' }
MozTextFontStyle class >> NORMAL [
	"This method was automatically generated"
	^ NORMAL
]

{ #category : #'accessing enum' }
MozTextFontStyle class >> OBLIQUE [
	"This method was automatically generated"
	^ OBLIQUE
]

{ #category : #'enum declaration' }
MozTextFontStyle class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		NORMAL 0
		ITALIC 1
		OBLIQUE 2
	)
]

{ #category : #'class initialization' }
MozTextFontStyle class >> fromSpartaSlant: aSpartaFontSlant [
	^ Styles at: aSpartaFontSlant ifAbsent: [ self NORMAL ]
]

{ #category : #'class initialization' }
MozTextFontStyle class >> initialize [
	self initializeEnumeration.
	
	Styles := { 
		SpartaFontSlant normal -> self NORMAL.
		SpartaFontSlant italic -> self ITALIC.
		SpartaFontSlant oblique -> self OBLIQUE
	} asDictionary
]
