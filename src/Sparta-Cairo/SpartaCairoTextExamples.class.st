Class {
	#name : #SpartaCairoTextExamples,
	#superclass : #Object,
	#traits : 'TSpartaTextExamples',
	#classTraits : 'TSpartaTextExamples classTrait',
	#category : 'Sparta-Cairo-Examples'
}

{ #category : #accessing }
SpartaCairoTextExamples class >> canvas: anExtent [
	^ SpartaCairoCanvas extent: anExtent
]
