Class {
	#name : #SkiaCompositionGeometryExamples,
	#superclass : #SkiaCompositorObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #'instance creation' }
SkiaCompositionGeometryExamples >> none [
	<gtExample>
	| aGeometry |
	
	aGeometry := SkiaCompositorGeometry none.
	
	^ aGeometry
]

{ #category : #'instance creation' }
SkiaCompositionGeometryExamples >> rectangle [
	<gtExample>
	| aGeometry aRectangle |
	
	aRectangle := 10@20 extent: 100@200.
	aGeometry := SkiaCompositorGeometry rectangle: aRectangle.
	
	^ aGeometry
]
