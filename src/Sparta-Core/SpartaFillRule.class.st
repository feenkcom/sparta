"
Fill rule is an algorithm which determines how a graphical shape with more than one closed outline will be filled.

"
Class {
	#name : #SpartaFillRule,
	#superclass : #Object,
	#category : #'Sparta-Core-Path'
}

{ #category : #'instance creation' }
SpartaFillRule class >> evenOdd [
	^ SpartaFillEvenOddRule new
]

{ #category : #'instance creation' }
SpartaFillRule class >> winding [
	^ SpartaFillWindingRule new
]

{ #category : #accessing }
SpartaFillRule >> newPathBuilder: aPathBuilderClass canvas: aSpartaCanvas [
	^ self subclassResponsibility
]
