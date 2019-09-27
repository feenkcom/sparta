Class {
	#name : #MozFillRule,
	#superclass : #MozEnum,
	#classVars : [
		'FILL_EVEN_ODD',
		'FILL_WINDING'
	],
	#category : 'Sparta-Moz2D-Enums'
}

{ #category : #'accessing enum' }
MozFillRule class >> FILL_EVEN_ODD [
	"This method was automatically generated"
	^ FILL_EVEN_ODD
]

{ #category : #'accessing enum' }
MozFillRule class >> FILL_WINDING [
	"This method was automatically generated"
	^ FILL_WINDING
]

{ #category : #'enum declaration' }
MozFillRule class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
	FILL_WINDING 0
	FILL_EVEN_ODD 1
	)
]

{ #category : #accessing }
MozFillRule class >> externalEnum [
	^ #FillRule
]

{ #category : #accessing }
MozFillRule class >> externalType [
	^ FFIInt8 new
]

{ #category : #'class initialization' }
MozFillRule class >> initialize [
	super initialize
]

{ #category : #'instance creation' }
MozFillRule class >> named: aFillRuleSymbol [
	aFillRuleSymbol = #nonzero
		ifTrue: [ ^ self FILL_WINDING ].
	aFillRuleSymbol = #evenodd
		ifTrue: [ ^ self FILL_EVEN_ODD ].
		
	self error: 'Unknown fill rule type'
]
