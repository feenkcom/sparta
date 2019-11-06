Class {
	#name : #MozTextExamples,
	#superclass : #Object,
	#traits : 'TSpartaTextExamples',
	#classTraits : 'TSpartaTextExamples classTrait',
	#category : #'Sparta-Moz2D-Examples'
}

{ #category : #accessing }
MozTextExamples class >> canvas: anExtent [
	^ MozCanvas extent: anExtent
]
