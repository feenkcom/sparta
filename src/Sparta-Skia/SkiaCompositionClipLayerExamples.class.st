Class {
	#name : #SkiaCompositionClipLayerExamples,
	#superclass : #SkiaCompositorObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaCompositionClipLayerExamples >> rectangle [
	<gtExample>
	| aLayer |
	
	aLayer := SkiaCompositionClipLayer rectangle: (10@20 extent: 200@300) offset: 30@10.
	
	^ aLayer
]
