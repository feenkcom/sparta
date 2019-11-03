Class {
	#name : #SkiaSkewPush,
	#superclass : #SkiaTransformationPush,
	#instVars : [
		'skewX',
		'skewY'
	],
	#category : #'Sparta-Skia-Utilities'
}

{ #category : #accessing }
SkiaSkewPush >> skewX [
	^ skewX
]

{ #category : #accessing }
SkiaSkewPush >> skewX: anObject [
	skewX := anObject
]

{ #category : #accessing }
SkiaSkewPush >> skewY [
	^ skewY
]

{ #category : #accessing }
SkiaSkewPush >> skewY: anObject [
	skewY := anObject
]
