Class {
	#name : #MozUserFontLoadState,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'STATUS_FAILED',
		'STATUS_LOADED',
		'STATUS_LOADING',
		'STATUS_NOT_LOADED'
	],
	#category : 'Sparta-Moz2D-Text'
}

{ #category : #'accessing enum' }
MozUserFontLoadState class >> STATUS_FAILED [
	"This method was automatically generated"
	^ STATUS_FAILED
]

{ #category : #'accessing enum' }
MozUserFontLoadState class >> STATUS_LOADED [
	"This method was automatically generated"
	^ STATUS_LOADED
]

{ #category : #'accessing enum' }
MozUserFontLoadState class >> STATUS_LOADING [
	"This method was automatically generated"
	^ STATUS_LOADING
]

{ #category : #'accessing enum' }
MozUserFontLoadState class >> STATUS_NOT_LOADED [
	"This method was automatically generated"
	^ STATUS_NOT_LOADED
]

{ #category : #'enum declaration' }
MozUserFontLoadState class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		STATUS_NOT_LOADED 0
		STATUS_LOADING 1 
		STATUS_LOADED 2
		STATUS_FAILED 3
	)
]

{ #category : #'class initialization' }
MozUserFontLoadState class >> initialize [
	self initializeEnumeration
]
