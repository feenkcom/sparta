Class {
	#name : #SkiaTextMetrics,
	#superclass : #Object,
	#instVars : [
		'bounds',
		'advance'
	],
	#category : #'Sparta-Skia-Text'
}

{ #category : #accessing }
SkiaTextMetrics >> advance [
	^ advance
]

{ #category : #accessing }
SkiaTextMetrics >> advance: anObject [
	advance := anObject
]

{ #category : #converting }
SkiaTextMetrics >> asSpartaMetrics [
	^ SpartaTextMetrics new
		advance: advance;
		left: bounds left;
		top: bounds top;
		right: bounds right;
		bottom: bounds bottom
]

{ #category : #accessing }
SkiaTextMetrics >> bounds [
	^ bounds
]

{ #category : #accessing }
SkiaTextMetrics >> bounds: anObject [
	bounds := anObject
]
