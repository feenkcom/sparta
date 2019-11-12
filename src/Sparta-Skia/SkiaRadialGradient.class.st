Class {
	#name : #SkiaRadialGradient,
	#superclass : #SkiaGradient,
	#traits : 'TSpartaRadialGradientPaint',
	#classTraits : 'TSpartaRadialGradientPaint classTrait',
	#instVars : [
		'center',
		'radius'
	],
	#category : #'Sparta-Skia-Paints'
}

{ #category : #converting }
SkiaRadialGradient >> asShader [
	| theColors thePositions |
	
	theColors := self stops collect: #value.
	thePositions := self stops collect: #key.

	^ SkiaRadialGradientShader
		center: center
		radius: radius
		colors: theColors
		positions: thePositions
		mode: self tileMode
		flags: 0
		matrix: self transformation
]

{ #category : #accessing }
SkiaRadialGradient >> center [
	<return: #Point>

	^ center
]

{ #category : #accessing }
SkiaRadialGradient >> center: aPoint [
	center := aPoint
]

{ #category : #initialization }
SkiaRadialGradient >> initialize [
	super initialize.
	
	center := 0@0.
	radius := 0
]

{ #category : #accessing }
SkiaRadialGradient >> radius [
	<return: #Number>

	^ radius
]

{ #category : #accessing }
SkiaRadialGradient >> radius: aNumber [
	radius := aNumber
]
