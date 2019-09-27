"
I am a shared pool of Moz2D constants.

I should be deleted in the future and completely replaced by external enumerations
"
Class {
	#name : #MozSharedPool,
	#superclass : #SharedPool,
	#classVars : [
		'FILL_RULE_EVEN_ODD',
		'FILL_RULE_WINDING'
	],
	#category : 'Sparta-Moz2D-Library'
}

{ #category : #'class initialization' }
MozSharedPool class >> initialize [
	super initialize.

	self initializeFillRules.
]

{ #category : #initialization }
MozSharedPool class >> initializeFillRules [
	FILL_RULE_WINDING := 0.
	FILL_RULE_EVEN_ODD := 1
]
