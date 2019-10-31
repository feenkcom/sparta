Class {
	#name : #MozTextSuppressBreak,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'eNoSuppressBreak',
		'eSuppressAllBreaks',
		'eSuppressInitialBreak'
	],
	#category : 'Sparta-Moz2D-Text-Enums'
}

{ #category : #'accessing enum' }
MozTextSuppressBreak class >> eNoSuppressBreak [
	"This method was automatically generated"
	^ eNoSuppressBreak
]

{ #category : #'accessing enum' }
MozTextSuppressBreak class >> eSuppressAllBreaks [
	"This method was automatically generated"
	^ eSuppressAllBreaks
]

{ #category : #'accessing enum' }
MozTextSuppressBreak class >> eSuppressInitialBreak [
	"This method was automatically generated"
	^ eSuppressInitialBreak
]

{ #category : #'enum declaration' }
MozTextSuppressBreak class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		eNoSuppressBreak 0 
		eSuppressInitialBreak 1 "Measure the range of text as if there is no break before it."
		eSuppressAllBreaks 2 "Measure the range of text as if it contains no break"
	)
]

{ #category : #'class initialization' }
MozTextSuppressBreak class >> initialize [
	self initializeEnumeration
]
