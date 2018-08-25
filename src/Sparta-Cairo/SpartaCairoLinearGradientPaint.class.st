Class {
	#name : #SpartaCairoLinearGradientPaint,
	#superclass : #SpartaCairoGradientPaint,
	#traits : 'TSpartaLinearGradientPaint',
	#classTraits : 'TSpartaLinearGradientPaint classTrait',
	#instVars : [
		'begin',
		'end'
	],
	#category : 'Sparta-Cairo-Paints'
}

{ #category : #converting }
SpartaCairoLinearGradientPaint >> asSpartaCairoPatternOn: aSpartaCairoCanvas [
	^ aSpartaCairoCanvas pattern linearGradient: self
]

{ #category : #accessing }
SpartaCairoLinearGradientPaint >> begin [
	^ begin
]

{ #category : #accessing }
SpartaCairoLinearGradientPaint >> begin: aPoint [
	begin := aPoint
]

{ #category : #accessing }
SpartaCairoLinearGradientPaint >> end [
	^ end
]

{ #category : #accessing }
SpartaCairoLinearGradientPaint >> end: aPoint [
	end := aPoint
]

{ #category : #accessing }
SpartaCairoLinearGradientPaint >> formExtent [
	^ (self begin ifNil: [ 0@0 ]) + (self end ifNil: [ 0@0 ])
]
