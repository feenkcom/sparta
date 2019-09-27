Class {
	#name : #MozTextBreakPriority,
	#superclass : #FFIExternalEnumeration,
	#classVars : [
		'eNoBreak',
		'eNormalBreak',
		'eWordWrapBreak'
	],
	#category : 'Sparta-Moz2D-Text-Enums'
}

{ #category : #'accessing enum' }
MozTextBreakPriority class >> eNoBreak [
	"This method was automatically generated"
	^ eNoBreak
]

{ #category : #'accessing enum' }
MozTextBreakPriority class >> eNormalBreak [
	"This method was automatically generated"
	^ eNormalBreak
]

{ #category : #'accessing enum' }
MozTextBreakPriority class >> eWordWrapBreak [
	"This method was automatically generated"
	^ eWordWrapBreak
]

{ #category : #'enum declaration' }
MozTextBreakPriority class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		eNoBreak       0
		eWordWrapBreak 1
		eNormalBreak   2
	)
]

{ #category : #'class initialization' }
MozTextBreakPriority class >> initialize [
	self initializeEnumeration
]

{ #category : #testing }
MozTextBreakPriority >> canWrapHyphens [
	^ self ~= self class eNoBreak
]

{ #category : #testing }
MozTextBreakPriority >> canWrapWord [
	^ self == self class eWordWrapBreak
]
