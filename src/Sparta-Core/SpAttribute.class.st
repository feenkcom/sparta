Class {
	#name : #SpAttribute,
	#superclass : #Object,
	#category : #'Sparta-Core-Text-Model'
}

{ #category : #properties }
SpAttribute >> applyOnFont: aFontBuilder with: aSpan [
	"Attribute may customize a font used to render text"
]

{ #category : #properties }
SpAttribute >> applyOnSpartaMatrix: aMatrix with: aSpan [
	"Attribute may customize a transformation matrix"
]

{ #category : #properties }
SpAttribute >> applyOnText: aTextPainter with: aSpan [
	"Attribute may customize a text painter"
]

{ #category : #drawing }
SpAttribute >> drawAboveOn: aCanvas with: aSpan [
	"Attribute may add additional visual effects"
]

{ #category : #drawing }
SpAttribute >> drawBelowOn: aCanvas with: aSpan [
	"Attribute may add additional visual effects"
]
