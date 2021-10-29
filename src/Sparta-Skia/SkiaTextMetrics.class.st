Class {
	#name : #SkiaTextMetrics,
	#superclass : #Object,
	#instVars : [
		'bounds',
		'advance'
	],
	#category : 'Sparta-Skia-Text'
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
		bounds: bounds
]

{ #category : #accessing }
SkiaTextMetrics >> bounds [
	^ bounds
]

{ #category : #accessing }
SkiaTextMetrics >> bounds: anObject [
	bounds := anObject
]
