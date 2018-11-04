Class {
	#name : #SpSingleLineTextRenderer,
	#superclass : #SpTextRenderer,
	#category : #'Sparta-Core-Text-Rendering'
}

{ #category : #rendering }
SpSingleLineTextRenderer >> renderOn: aCanvas [

	layout spans do: [ :aSpan |
		self renderSpan: aSpan on: aCanvas ]
]
