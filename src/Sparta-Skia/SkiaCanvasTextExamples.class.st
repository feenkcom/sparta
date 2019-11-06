Class {
	#name : #SkiaCanvasTextExamples,
	#superclass : #Object,
	#traits : 'TSpartaTextExamples',
	#classTraits : 'TSpartaTextExamples classTrait',
	#category : #'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaCanvasTextExamples class >> canvas: anExtent [
	^ SkiaCanvas extent: anExtent
]
