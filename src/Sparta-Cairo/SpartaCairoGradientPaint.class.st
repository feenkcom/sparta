Class {
	#name : #SpartaCairoGradientPaint,
	#superclass : #SpartaCairoPaint,
	#traits : 'TSpartaGradientPaint',
	#classTraits : 'TSpartaGradientPaint classTrait',
	#instVars : [
		'stops'
	],
	#category : 'Sparta-Cairo-Paints'
}

{ #category : #initialization }
SpartaCairoGradientPaint >> initialize [
	super initialize.
	
	self extendMode: SpartaCairoExtendMode CAIRO_EXTEND_PAD
]

{ #category : #accessing }
SpartaCairoGradientPaint >> stops [
	^ stops
]

{ #category : #accessing }
SpartaCairoGradientPaint >> stops: aCollectionOfStops [
	stops := aCollectionOfStops
]
