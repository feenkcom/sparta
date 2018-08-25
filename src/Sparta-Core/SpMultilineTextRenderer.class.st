Class {
	#name : #SpMultilineTextRenderer,
	#superclass : #SpTextRenderer,
	#category : 'Sparta-Core-Text-Rendering'
}

{ #category : #rendering }
SpMultilineTextRenderer >> renderLine: aLine on: aCanvas [

	aLine do: [ :span |
		self renderSpan: span on: aCanvas ]
]

{ #category : #rendering }
SpMultilineTextRenderer >> renderOn: aCanvas [

	layout lines do: [ :line |
		self renderLine: line on: aCanvas ]
]
