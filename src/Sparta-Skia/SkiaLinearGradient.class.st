Class {
	#name : #SkiaLinearGradient,
	#superclass : #SkiaGradient,
	#traits : 'TSpartaLinearGradientPaint',
	#classTraits : 'TSpartaLinearGradientPaint classTrait',
	#instVars : [
		'begin',
		'end'
	],
	#category : #'Sparta-Skia-Paints'
}

{ #category : #converting }
SkiaLinearGradient >> asShader [
	| theColors thePositions |
	
	theColors := self stops collect: #value.
	thePositions := self stops collect: #key.

	^ SkiaLinearGradientShader
		from: self begin to: self end
		colors: theColors
		positions: thePositions
		mode: self tileMode
		flags: 0
		matrix: self transformation
]

{ #category : #accessing }
SkiaLinearGradient >> begin [
	<return: #Point>

	^ begin
]

{ #category : #accessing }
SkiaLinearGradient >> begin: aPoint [
	begin := aPoint
]

{ #category : #accessing }
SkiaLinearGradient >> end [
	<return: #Point>

	^ end
]

{ #category : #accessing }
SkiaLinearGradient >> end: aPoint [
	end := aPoint
]
