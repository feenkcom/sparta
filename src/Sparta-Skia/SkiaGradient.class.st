Class {
	#name : #SkiaGradient,
	#superclass : #Object,
	#traits : 'TSpartaPaint + TSpartaGradientPaint',
	#classTraits : 'TSpartaPaint classTrait + TSpartaGradientPaint classTrait',
	#instVars : [
		'stops',
		'transformation',
		'tileMode'
	],
	#category : #'Sparta-Skia-Paints'
}

{ #category : #converting }
SkiaGradient >> asShader [
	^ self subclassResponsibility
]

{ #category : #'extend modes' }
SkiaGradient >> clamp [
	"Do not repeat"
	
	self tileMode: SkiaTileMode Clamp
]

{ #category : #initialization }
SkiaGradient >> initialize [
	super initialize.
	
	transformation := SpartaMatrix new.
	stops := #().
	
	self clamp.
]

{ #category : #'extend modes' }
SkiaGradient >> reflect [
	"Mirror the image"

	self tileMode: SkiaTileMode Mirror
]

{ #category : #'extend modes' }
SkiaGradient >> repeat [
	"Repeat in both axis"
	
	self tileMode: SkiaTileMode Repeat
]

{ #category : #'extend modes' }
SkiaGradient >> repeatX [
	"Gradients always repeat in both axis"
	
	self tileMode: SkiaTileMode Repeat
]

{ #category : #'extend modes' }
SkiaGradient >> repeatY [
	"Gradients always repeat in both axis"
	
	self tileMode: SkiaTileMode Repeat
]

{ #category : #accessing }
SkiaGradient >> stops [
	^ stops
]

{ #category : #accessing }
SkiaGradient >> stops: anArrayOfStops [
	stops := anArrayOfStops
]

{ #category : #accessing }
SkiaGradient >> tileMode [
	<return: #SkiaTileMode>

	^ tileMode
]

{ #category : #accessing }
SkiaGradient >> tileMode: aSkiaTileMode [
	tileMode := aSkiaTileMode
]

{ #category : #accessing }
SkiaGradient >> transformation [
	^ transformation
]

{ #category : #accessing }
SkiaGradient >> transformation: aMatrix [
	transformation := aMatrix
]
