Class {
	#name : #SkiaSurfacePropsExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #accessing }
SkiaSurfacePropsExamples >> default [
	<gtExample>
	| aSurfaceProps |
	
	aSurfaceProps := SkiaSurfaceProps new.
	self assert: aSurfaceProps flags equals: 1.
	self assert: aSurfaceProps pixelGeometry equals: SkiaPixelGeometry RGBH.
	
	^ aSurfaceProps
]
