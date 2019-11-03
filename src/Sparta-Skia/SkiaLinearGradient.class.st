Class {
	#name : #SkiaLinearGradient,
	#superclass : #Object,
	#traits : 'TSpartaPaint + TSpartaGradientPaint + TSpartaLinearGradientPaint',
	#classTraits : 'TSpartaPaint classTrait + TSpartaGradientPaint classTrait + TSpartaLinearGradientPaint classTrait',
	#instVars : [
		'begin',
		'end',
		'stops',
		'transformation',
		'extend'
	],
	#category : #'Sparta-Skia-Core'
}

{ #category : #accessing }
SkiaLinearGradient >> begin: aPoint [
	begin := aPoint
]

{ #category : #'extend modes' }
SkiaLinearGradient >> clamp [
	"Do not repeat"
	extend := #clamp
]

{ #category : #accessing }
SkiaLinearGradient >> end: aPoint [
	end := aPoint
]

{ #category : #'extend modes' }
SkiaLinearGradient >> reflect [
	"Mirror the image"
	extend := #reflect
]

{ #category : #'extend modes' }
SkiaLinearGradient >> repeat [
	"Repeat in both axis"
	extend := #repeat
]

{ #category : #'extend modes' }
SkiaLinearGradient >> repeatX [
	"Only X axis"
	extend := #repeatX
]

{ #category : #'extend modes' }
SkiaLinearGradient >> repeatY [
	"Only Y axis"
	extend := #repeatY
]

{ #category : #accessing }
SkiaLinearGradient >> stops: anArrayOfStops [
	stops := anArrayOfStops
]

{ #category : #accessing }
SkiaLinearGradient >> transformation [
	^ transformation ifNil: [ transformation := SpartaMatrix new ]
]

{ #category : #accessing }
SkiaLinearGradient >> transformation: aMatrix [
	transformation := aMatrix
]
