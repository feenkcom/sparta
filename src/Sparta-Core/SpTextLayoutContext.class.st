Class {
	#name : #SpTextLayoutContext,
	#superclass : #Object,
	#instVars : [
		'maxHeight',
		'maxWidth',
		'accumulatedHeight',
		'accumulatedWidth',
		'position',
		'rope'
	],
	#category : #'Sparta-Core-Text-Rendering'
}

{ #category : #accessing }
SpTextLayoutContext >> availableHeight [
	^ maxHeight - accumulatedHeight
]

{ #category : #accessing }
SpTextLayoutContext >> availableWidth [
	^ maxWidth - accumulatedWidth
]

{ #category : #initialization }
SpTextLayoutContext >> initialize [
	super initialize.
	
	maxWidth := Float infinity.
	maxHeight := Float infinity.
	accumulatedWidth := 0.
	accumulatedHeight := 0.
	position := 1.
]

{ #category : #accessing }
SpTextLayoutContext >> maxHeight: aNumber [
	maxHeight := aNumber
]

{ #category : #accessing }
SpTextLayoutContext >> maxWidth: aNumber [
	maxWidth := aNumber
]

{ #category : #accessing }
SpTextLayoutContext >> movePosition: aNumber [
	position := aNumber
]

{ #category : #accessing }
SpTextLayoutContext >> position [
	^ position
]

{ #category : #accessing }
SpTextLayoutContext >> pushPosition: aNumber [
	position := position + aNumber
]

{ #category : #adding }
SpTextLayoutContext >> pushSpan: aSpan [
	self subclassResponsibility
]

{ #category : #accessing }
SpTextLayoutContext >> rope: aRope [
	rope := aRope
]
