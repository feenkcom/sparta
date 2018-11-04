Class {
	#name : #SpLinearGradient,
	#superclass : #Object,
	#traits : 'TSpartaPaint + TSpartaGradientPaint + TSpartaLinearGradientPaint',
	#classTraits : 'TSpartaPaint classTrait + TSpartaGradientPaint classTrait + TSpartaLinearGradientPaint classTrait',
	#instVars : [
		'begin',
		'end',
		'stops',
		'transformation',
		'extend'
	],
	#category : #'Sparta-Core-Text-Model'
}

{ #category : #converting }
SpLinearGradient >> asSpartaPaintOn: aSpartaCanvas [
	| gradient |
	gradient := aSpartaCanvas paint linearGradient.
	
	begin ifNotNil: [ gradient begin: begin ].
	end ifNotNil: [ gradient end: end ].
	stops ifNotNil: [ gradient stops: stops ].
	transformation ifNotNil: [ gradient transformation: transformation ].
	extend ifNotNil: [ gradient perform: extend ].

	^ gradient
]

{ #category : #accessing }
SpLinearGradient >> begin: aPoint [
	begin := aPoint
]

{ #category : #'extend modes' }
SpLinearGradient >> clamp [
	"Do not repeat"
	extend := #clamp
]

{ #category : #accessing }
SpLinearGradient >> end: aPoint [
	end := aPoint
]

{ #category : #'extend modes' }
SpLinearGradient >> reflect [
	"Mirror the image"
	extend := #reflect
]

{ #category : #'extend modes' }
SpLinearGradient >> repeat [
	"Repeat in both axis"
	extend := #repeat
]

{ #category : #'extend modes' }
SpLinearGradient >> repeatX [
	"Only X axis"
	extend := #repeatX
]

{ #category : #'extend modes' }
SpLinearGradient >> repeatY [
	"Only Y axis"
	extend := #repeatY
]

{ #category : #accessing }
SpLinearGradient >> stops: anArrayOfStops [
	stops := anArrayOfStops
]

{ #category : #accessing }
SpLinearGradient >> transformation [
	^ transformation ifNil: [ transformation := SpartaMatrix new ]
]

{ #category : #accessing }
SpLinearGradient >> transformation: aMatrix [
	transformation := aMatrix
]
