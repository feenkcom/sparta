Class {
	#name : #SkiaCompositionGeometryExamples,
	#superclass : #SkiaCompositorObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #'instance creation' }
SkiaCompositionGeometryExamples >> none [
	<gtExample>
	<return: #SkiaCompositorGeometry>
	| aGeometry |
	aGeometry := SkiaCompositorGeometry none.

	^ aGeometry
]

{ #category : #'instance creation' }
SkiaCompositionGeometryExamples >> rectangle [
	<gtExample>
	<return: #SkiaCompositorGeometry>
	| aGeometry aRectangle |
	aRectangle := 10 @ 20 extent: 100 @ 200.
	aGeometry := SkiaCompositorGeometry rectangle: aRectangle.

	^ aGeometry
]
