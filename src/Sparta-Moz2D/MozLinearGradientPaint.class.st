Class {
	#name : #MozLinearGradientPaint,
	#superclass : #MozGradientPaint,
	#traits : 'TSpartaLinearGradientPaint',
	#classTraits : 'TSpartaLinearGradientPaint classTrait',
	#instVars : [
		'begin',
		'end'
	],
	#category : 'Sparta-Moz2D-Paints'
}

{ #category : #converting }
MozLinearGradientPaint >> asMozPatternOn: aMozCanvas [
	^ aMozCanvas pattern linearGradient: self
]

{ #category : #accessing }
MozLinearGradientPaint >> begin [
	^ begin
]

{ #category : #accessing }
MozLinearGradientPaint >> begin: aPoint [
	begin := aPoint
]

{ #category : #accessing }
MozLinearGradientPaint >> end [
	^ end
]

{ #category : #accessing }
MozLinearGradientPaint >> end: aPoint [
	end := aPoint
]

{ #category : #converting }
MozLinearGradientPaint >> formExtent [
	^ (self begin ifNil: [ 0@0 ]) + (self end ifNil: [ 0@0 ])
]
