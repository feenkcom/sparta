Class {
	#name : #MozRadialGradientPaint,
	#superclass : #MozGradientPaint,
	#traits : 'TSpartaRadialGradientPaint',
	#classTraits : 'TSpartaRadialGradientPaint classTrait',
	#instVars : [
		'innerCenter',
		'innerRadius',
		'outerCenter',
		'outerRadius'
	],
	#category : #'Sparta-Moz2D-Paints'
}

{ #category : #converting }
MozRadialGradientPaint >> asMozPatternOn: aMozCanvas [
	^ aMozCanvas pattern radialGradient: self
]

{ #category : #accessing }
MozRadialGradientPaint >> center [
	^ innerCenter
]

{ #category : #accessing }
MozRadialGradientPaint >> center: aPoint [
	innerCenter := aPoint.
	outerCenter := aPoint
]

{ #category : #converting }
MozRadialGradientPaint >> formExtent [
	^ ((self innerRadius + self outerRadius) max: 1) asPoint
]

{ #category : #initialization }
MozRadialGradientPaint >> initialize [
	super initialize.
	
	innerRadius := 0.0.
	outerRadius := 0.0
]

{ #category : #accessing }
MozRadialGradientPaint >> innerCenter [
	^ innerCenter
]

{ #category : #accessing }
MozRadialGradientPaint >> innerCenter: aPoint [
	innerCenter := aPoint
]

{ #category : #accessing }
MozRadialGradientPaint >> innerRadius [
	^ innerRadius
]

{ #category : #accessing }
MozRadialGradientPaint >> innerRadius: aNumber [
	innerRadius := aNumber
]

{ #category : #accessing }
MozRadialGradientPaint >> outerCenter [
	^ outerCenter
]

{ #category : #accessing }
MozRadialGradientPaint >> outerCenter: aPoint [
	outerCenter := aPoint
]

{ #category : #accessing }
MozRadialGradientPaint >> outerRadius [
	^ outerRadius
]

{ #category : #accessing }
MozRadialGradientPaint >> outerRadius: aNumber [
	outerRadius := aNumber
]

{ #category : #accessing }
MozRadialGradientPaint >> radius: aNumber [
	innerRadius := 0.
	outerRadius := aNumber
]
