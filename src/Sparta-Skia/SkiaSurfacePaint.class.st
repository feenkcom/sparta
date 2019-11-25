Class {
	#name : #SkiaSurfacePaint,
	#superclass : #Object,
	#traits : 'TSpartaPaint + TSpartaSurfacePaint',
	#classTraits : 'TSpartaPaint classTrait + TSpartaSurfacePaint classTrait',
	#instVars : [
		'tileModeX',
		'tileModeY',
		'matrix',
		'skiaImage',
		'samplingArea',
		'filterQuality'
	],
	#category : #'Sparta-Skia-Paints'
}

{ #category : #'extend modes' }
SkiaSurfacePaint >> clamp [
	"Do not repeat"
	tileModeX := tileModeY := SkiaTileMode Clamp
]

{ #category : #accessing }
SkiaSurfacePaint >> filterQuality [
	<return: #SkiaFilterQuality>

	^ filterQuality
]

{ #category : #accessing }
SkiaSurfacePaint >> image [
	^ skiaImage
]

{ #category : #initialization }
SkiaSurfacePaint >> initialize [
	super initialize.

	tileModeX := SkiaTileMode Clamp.
	tileModeY := SkiaTileMode Clamp.

	"not specified"
	samplingArea := nil.

	"not specified"
	matrix := nil.

	filterQuality := SkiaFilterQuality Low
]

{ #category : #testing }
SkiaSurfacePaint >> isCanvas [
	<return: #Boolean>

	^ skiaImage isKindOf: SkiaCanvas
]

{ #category : #testing }
SkiaSurfacePaint >> isImage [
	<return: #Boolean>

	^ skiaImage isKindOf: SkiaSurface
]

{ #category : #testing }
SkiaSurfacePaint >> needsShader [
	<return: #Boolean>

	^ tileModeX ~= SkiaTileMode Clamp
		or: [ tileModeY ~= SkiaTileMode Clamp
			or: [ (matrix isNotNil and: [ matrix isIdentity not ]) ] ]
]

{ #category : #'extend modes' }
SkiaSurfacePaint >> reflect [
	"Mirror the image"
	tileModeX := tileModeY := SkiaTileMode Mirror
]

{ #category : #'extend modes' }
SkiaSurfacePaint >> repeat [
	"Repeat in both axis"
	tileModeX := tileModeY := SkiaTileMode Repeat
]

{ #category : #'extend modes' }
SkiaSurfacePaint >> repeatX [
	"Only X axis"
	tileModeX := SkiaTileMode Repeat
]

{ #category : #'extend modes' }
SkiaSurfacePaint >> repeatY [
	"Only Y axis"
	tileModeY := SkiaTileMode Repeat
]

{ #category : #'sampling filters' }
SkiaSurfacePaint >> samplingArea: aRectangle [
	samplingArea := aRectangle
]

{ #category : #'sampling filters' }
SkiaSurfacePaint >> samplingGood [
	filterQuality := SkiaFilterQuality Low
]

{ #category : #'sampling filters' }
SkiaSurfacePaint >> samplingLinear [
	filterQuality := SkiaFilterQuality Medium
]

{ #category : #'sampling filters' }
SkiaSurfacePaint >> samplingPoint [
	filterQuality := SkiaFilterQuality None
]

{ #category : #accessing }
SkiaSurfacePaint >> source: aSurface [
	skiaImage := aSurface.

	self
		assert: [ (skiaImage isKindOf: SkiaImage) or: [ skiaImage isKindOf: SkiaCanvas ] ]
		description: [ 'Only skia image or canvas can be used as a source for the paint' ].
]

{ #category : #accessing }
SkiaSurfacePaint >> transformation: aMatrix [
	matrix := aMatrix
]
