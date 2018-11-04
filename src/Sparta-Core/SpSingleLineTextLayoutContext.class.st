Class {
	#name : #SpSingleLineTextLayoutContext,
	#superclass : #SpTextLayoutContext,
	#instVars : [
		'spans'
	],
	#category : #'Sparta-Core-Text-Rendering'
}

{ #category : #initialization }
SpSingleLineTextLayoutContext >> initialize [
	super initialize.
		
	spans := OrderedCollection new
]

{ #category : #adding }
SpSingleLineTextLayoutContext >> pushSpan: aSpan [
	spans add: aSpan.
	accumulatedWidth := accumulatedWidth + aSpan width
]

{ #category : #accessing }
SpSingleLineTextLayoutContext >> spans [
	^ spans
]
