Class {
	#name : #MozGradientPaint,
	#superclass : #MozPaint,
	#traits : 'TSpartaGradientPaint',
	#classTraits : 'TSpartaGradientPaint classTrait',
	#instVars : [
		'stops'
	],
	#category : 'Sparta-Moz2D-Paints'
}

{ #category : #accessing }
MozGradientPaint >> stops [
	^ stops
]

{ #category : #accessing }
MozGradientPaint >> stops: aCollectionOfStops [
	stops := aCollectionOfStops
]
