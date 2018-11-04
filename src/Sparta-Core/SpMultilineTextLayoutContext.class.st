Class {
	#name : #SpMultilineTextLayoutContext,
	#superclass : #SpTextLayoutContext,
	#instVars : [
		'lines',
		'spansStack',
		'isSplitted'
	],
	#category : #'Sparta-Core-Text-Rendering'
}

{ #category : #initialization }
SpMultilineTextLayoutContext >> initialize [
	super initialize.
	
	spansStack := LinkedList new.
	lines := OrderedCollection new.
	isSplitted := false
]

{ #category : #initialization }
SpMultilineTextLayoutContext >> initializeForNewLine [
	spansStack removeAll.
	accumulatedWidth := 0
]

{ #category : #testing }
SpMultilineTextLayoutContext >> isSplitted [
	^ isSplitted
]

{ #category : #accessing }
SpMultilineTextLayoutContext >> lines [
	^ lines
]

{ #category : #adding }
SpMultilineTextLayoutContext >> pushLine [
	| line spans |
	spans := spansStack asArray.
	self initializeForNewLine.

	line := SpTextLineSegment rope: rope spans: spans.
	lines add: line.
	
	accumulatedHeight := accumulatedHeight + line height
]

{ #category : #adding }
SpMultilineTextLayoutContext >> pushSpan: aSpan [
	spansStack addLast: aSpan.
	accumulatedWidth := accumulatedWidth + aSpan width.
	isSplitted := aSpan isSplitted
]
