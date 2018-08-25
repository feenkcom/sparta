Class {
	#name : #SpartaCairoExamples,
	#superclass : #Object,
	#traits : 'TSpartaExamples',
	#classTraits : 'TSpartaExamples classTrait',
	#category : 'Sparta-Cairo-Examples'
}

{ #category : #'instance creation' }
SpartaCairoExamples class >> canvas: anExtent [
	^ SpartaCairoCanvas extent: anExtent
]
