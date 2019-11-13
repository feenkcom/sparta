Class {
	#name : #SkiaGaussianBlurFilter,
	#superclass : #SkiaSingleSourceFilter,
	#traits : 'TSpartaGaussianBlurFilter',
	#classTraits : 'TSpartaGaussianBlurFilter classTrait',
	#instVars : [
		'sigma'
	],
	#category : #'Sparta-Skia-Filters'
}

{ #category : #converting }
SkiaGaussianBlurFilter >> asSkiaImageFilterOn: aSkiaFilterPainter [
	^ SkiaImageFilterBlur sigma: sigma asPoint
]

{ #category : #initialization }
SkiaGaussianBlurFilter >> initialize [
	super initialize.
	
	sigma := 0
]

{ #category : #accessing }
SkiaGaussianBlurFilter >> stdDeviation: aFloat [
	sigma := aFloat
]
