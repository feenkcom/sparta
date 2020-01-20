Class {
	#name : #SpartaCairoRadialGradientPaint,
	#superclass : #SpartaCairoGradientPaint,
	#traits : 'TSpartaRadialGradientPaint',
	#classTraits : 'TSpartaRadialGradientPaint classTrait',
	#instVars : [
		'center',
		'radius'
	],
	#category : #'Sparta-Cairo-Paints'
}

{ #category : #converting }
SpartaCairoRadialGradientPaint >> asSpartaCairoPatternOn: aSpartaCairoCanvas [
	^ aSpartaCairoCanvas pattern radialGradient: self
]

{ #category : #accessing }
SpartaCairoRadialGradientPaint >> center [
	<return: #Point or: nil>

	^ center
]

{ #category : #accessing }
SpartaCairoRadialGradientPaint >> center: aPoint [
	center := aPoint
]

{ #category : #converting }
SpartaCairoRadialGradientPaint >> formExtent [
	^ (self radius * 2) asPoint
]

{ #category : #initialization }
SpartaCairoRadialGradientPaint >> initialize [
	super initialize.
	
	radius := 0.0
]

{ #category : #accessing }
SpartaCairoRadialGradientPaint >> radius [
	<return: #Number>

	^ radius
]

{ #category : #accessing }
SpartaCairoRadialGradientPaint >> radius: aNumber [
	radius := aNumber
]
