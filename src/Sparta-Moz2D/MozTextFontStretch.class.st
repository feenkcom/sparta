Class {
	#name : #MozTextFontStretch,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'CONDENSED',
		'EXPANDED',
		'EXTRA_CONDENSED',
		'EXTRA_EXPANDED',
		'NORMAL',
		'SEMI_CONDENSED',
		'SEMI_EXPANDED',
		'ULTRA_CONDENSED',
		'ULTRA_EXPANDED'
	],
	#category : 'Sparta-Moz2D-Text-Enums'
}

{ #category : #'accessing enum' }
MozTextFontStretch class >> CONDENSED [
	"This method was automatically generated"
	^ CONDENSED
]

{ #category : #'accessing enum' }
MozTextFontStretch class >> EXPANDED [
	"This method was automatically generated"
	^ EXPANDED
]

{ #category : #'accessing enum' }
MozTextFontStretch class >> EXTRA_CONDENSED [
	"This method was automatically generated"
	^ EXTRA_CONDENSED
]

{ #category : #'accessing enum' }
MozTextFontStretch class >> EXTRA_EXPANDED [
	"This method was automatically generated"
	^ EXTRA_EXPANDED
]

{ #category : #'accessing enum' }
MozTextFontStretch class >> NORMAL [
	"This method was automatically generated"
	^ NORMAL
]

{ #category : #'accessing enum' }
MozTextFontStretch class >> SEMI_CONDENSED [
	"This method was automatically generated"
	^ SEMI_CONDENSED
]

{ #category : #'accessing enum' }
MozTextFontStretch class >> SEMI_EXPANDED [
	"This method was automatically generated"
	^ SEMI_EXPANDED
]

{ #category : #'accessing enum' }
MozTextFontStretch class >> ULTRA_CONDENSED [
	"This method was automatically generated"
	^ ULTRA_CONDENSED
]

{ #category : #'accessing enum' }
MozTextFontStretch class >> ULTRA_EXPANDED [
	"This method was automatically generated"
	^ ULTRA_EXPANDED
]

{ #category : #'enum declaration' }
MozTextFontStretch class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		ULTRA_CONDENSED -4
		EXTRA_CONDENSED -3
		CONDENSED       -2
		SEMI_CONDENSED  -1
		NORMAL          0
		SEMI_EXPANDED   1
		EXPANDED        2
		EXTRA_EXPANDED  3
		ULTRA_EXPANDED  4
	)
]

{ #category : #'class initialization' }
MozTextFontStretch class >> initialize [
	self initializeEnumeration
]
