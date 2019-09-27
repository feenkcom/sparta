Class {
	#name : #MozSurfacePaint,
	#superclass : #MozPaint,
	#traits : 'TSpartaSurfacePaint',
	#classTraits : 'TSpartaSurfacePaint classTrait',
	#instVars : [
		'surface',
		'samplingArea',
		'samplingFilter'
	],
	#category : 'Sparta-Moz2D-Paints'
}

{ #category : #converting }
MozSurfacePaint >> asMozPatternOn: aMozCanvas [
	^ aMozCanvas pattern surface: self
]

{ #category : #initialization }
MozSurfacePaint >> initialize [
	super initialize.
	
	self samplingGood
]

{ #category : #'sampling filters' }
MozSurfacePaint >> samplingArea [
	^ samplingArea
]

{ #category : #'sampling filters' }
MozSurfacePaint >> samplingArea: aRectangle [
	samplingArea := aRectangle
]

{ #category : #'sampling filters' }
MozSurfacePaint >> samplingFilter [
	^ samplingFilter
]

{ #category : #'sampling filters' }
MozSurfacePaint >> samplingFilter: aSamplingFilter [
	samplingFilter := aSamplingFilter
]

{ #category : #'sampling filters' }
MozSurfacePaint >> samplingGood [
	self samplingFilter: MozSamplingMode GOOD
]

{ #category : #'sampling filters' }
MozSurfacePaint >> samplingLinear [
	self samplingFilter: MozSamplingMode LINEAR
]

{ #category : #'sampling filters' }
MozSurfacePaint >> samplingPoint [
	self samplingFilter: MozSamplingMode POINT
]

{ #category : #'sampling filters' }
MozSurfacePaint >> samplingSentinel [
	self samplingFilter: MozSamplingMode SENTINEL
]

{ #category : #accessing }
MozSurfacePaint >> source [
	^ surface
]

{ #category : #accessing }
MozSurfacePaint >> source: aSurface [
	surface := aSurface surface
]
