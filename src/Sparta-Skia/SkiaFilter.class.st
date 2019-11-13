Class {
	#name : #SkiaFilter,
	#superclass : #Object,
	#traits : 'TSpartaFilter',
	#classTraits : 'TSpartaFilter classTrait',
	#category : #'Sparta-Skia-Filters'
}

{ #category : #converting }
SkiaFilter >> asSkiaImageFilterOn: aSkiaFilterPainter [
	^ self subclassResponsibility
]

{ #category : #drawing }
SkiaFilter >> drawOn: aSkiaFilterPainter [

	
]
