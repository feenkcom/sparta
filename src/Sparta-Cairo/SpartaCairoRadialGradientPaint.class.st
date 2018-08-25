Class {
	#name : #SpartaCairoRadialGradientPaint,
	#superclass : #SpartaCairoGradientPaint,
	#traits : 'TSpartaRadialGradientPaint',
	#classTraits : 'TSpartaRadialGradientPaint classTrait',
	#instVars : [
		'innerCenter',
		'innerRadius',
		'outerCenter',
		'outerRadius'
	],
	#category : 'Sparta-Cairo-Paints'
}

{ #category : #converting }
SpartaCairoRadialGradientPaint >> asSpartaCairoPatternOn: aSpartaCairoCanvas [
	^ aSpartaCairoCanvas pattern radialGradient: self
]

{ #category : #initialization }
SpartaCairoRadialGradientPaint >> initialize [
	super initialize.
	
	innerRadius := 0.0.
	outerRadius := 0.0
]

{ #category : #accessing }
SpartaCairoRadialGradientPaint >> innerCenter [
	^ innerCenter
]

{ #category : #accessing }
SpartaCairoRadialGradientPaint >> innerCenter: aPoint [
	innerCenter := aPoint
]

{ #category : #accessing }
SpartaCairoRadialGradientPaint >> innerRadius [
	^ innerRadius
]

{ #category : #accessing }
SpartaCairoRadialGradientPaint >> innerRadius: aNumber [
	innerRadius := aNumber
]

{ #category : #accessing }
SpartaCairoRadialGradientPaint >> outerCenter [
	^ outerCenter
]

{ #category : #accessing }
SpartaCairoRadialGradientPaint >> outerCenter: aPoint [
	outerCenter := aPoint
]

{ #category : #accessing }
SpartaCairoRadialGradientPaint >> outerRadius [
	^ outerRadius
]

{ #category : #accessing }
SpartaCairoRadialGradientPaint >> outerRadius: aNumber [
	outerRadius := aNumber
]
