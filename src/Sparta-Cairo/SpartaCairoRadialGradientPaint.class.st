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
	#category : #'Sparta-Cairo-Paints'
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

{ #category : #'as yet unclassified' }
SpartaCairoRadialGradientPaint >> innerCenter: aPoint [
	innerCenter := aPoint
]

{ #category : #accessing }
SpartaCairoRadialGradientPaint >> innerRadius [
	^ innerRadius
]

{ #category : #'as yet unclassified' }
SpartaCairoRadialGradientPaint >> innerRadius: aNumber [
	innerRadius := aNumber
]

{ #category : #accessing }
SpartaCairoRadialGradientPaint >> outerCenter [
	^ outerCenter
]

{ #category : #'as yet unclassified' }
SpartaCairoRadialGradientPaint >> outerCenter: aPoint [
	outerCenter := aPoint
]

{ #category : #accessing }
SpartaCairoRadialGradientPaint >> outerRadius [
	^ outerRadius
]

{ #category : #'as yet unclassified' }
SpartaCairoRadialGradientPaint >> outerRadius: aNumber [
	outerRadius := aNumber
]
