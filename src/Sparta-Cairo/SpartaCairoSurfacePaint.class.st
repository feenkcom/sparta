Class {
	#name : #SpartaCairoSurfacePaint,
	#superclass : #SpartaCairoPaint,
	#traits : 'TSpartaSurfacePaint',
	#classTraits : 'TSpartaSurfacePaint classTrait',
	#instVars : [
		'samplingFilter',
		'samplingArea',
		'surface'
	],
	#category : 'Sparta-Cairo-Paints'
}

{ #category : #converting }
SpartaCairoSurfacePaint >> asSpartaCairoPatternOn: aSpartaCairoCanvas [
	^ aSpartaCairoCanvas pattern surface: self
]

{ #category : #'sampling filters' }
SpartaCairoSurfacePaint >> samplingArea: aRectangle [
	samplingArea := aRectangle
]

{ #category : #'sampling filters' }
SpartaCairoSurfacePaint >> samplingFilter [
		^ samplingFilter
]

{ #category : #'sampling filters' }
SpartaCairoSurfacePaint >> samplingFilter: aSamplingFilter [
	samplingFilter := aSamplingFilter
]

{ #category : #'sampling filters' }
SpartaCairoSurfacePaint >> samplingGood [
	self samplingFilter: SpartaCairoSamplingFilter CAIRO_FILTER_GOOD
]

{ #category : #'sampling filters' }
SpartaCairoSurfacePaint >> samplingLinear [
	self samplingFilter: SpartaCairoSamplingFilter CAIRO_FILTER_BILINEAR
]

{ #category : #'sampling filters' }
SpartaCairoSurfacePaint >> samplingPoint [
	self samplingFilter: SpartaCairoSamplingFilter CAIRO_FILTER_NEAREST
]

{ #category : #'sampling filters' }
SpartaCairoSurfacePaint >> samplingSentinel [
	self samplingFilter: SpartaCairoSamplingFilter CAIRO_FILTER_FAST
]

{ #category : #accessing }
SpartaCairoSurfacePaint >> source [
	^ surface
]

{ #category : #accessing }
SpartaCairoSurfacePaint >> source: aSurface [
	surface := aSurface surface
]
