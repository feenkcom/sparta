Class {
	#name : #SkiaCompositorGeometryExamples,
	#superclass : #SkiaCompositorObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #'instance creation' }
SkiaCompositorGeometryExamples >> none [
	<gtExample>
	| aGeometry |
	
	aGeometry := SkiaCompositorGeometry none.
	
	^ aGeometry
]

{ #category : #'instance creation' }
SkiaCompositorGeometryExamples >> rectangle [
	<gtExample>
	| aGeometry aRectangle |
	
	aRectangle := 10@20 extent: 100@200.
	aGeometry := SkiaCompositorGeometry rectangle: aRectangle.
	
	^ aGeometry
]
