Class {
	#name : #SkiaCompositorShadowLayerBulderExamples,
	#superclass : #SkiaCompositorObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaCompositorShadowLayerBulderExamples >> rectangle [
	<gtExample>
	| aShadowLayer |
	
	aShadowLayer := SkiaCompositorShadowLayerBulder new
		color: Color black;
		radius: 10.0 asPoint;
		offset: 20.0@30.0;
		pushRectangle: (0@0 extent: 200@100).
		
	^ aShadowLayer
]
