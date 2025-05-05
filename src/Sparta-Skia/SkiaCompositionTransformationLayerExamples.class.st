Class {
	#name : #SkiaCompositionTransformationLayerExamples,
	#superclass : #SkiaCompositorObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #'instance creation' }
SkiaCompositionTransformationLayerExamples >> identity [
	<gtExample>
	<return: #SkiaCompositionTransformationLayer>
	| aLayer |
	aLayer := SkiaCompositionTransformationLayer matrix: SpartaMatrix new.

	^ aLayer
]
