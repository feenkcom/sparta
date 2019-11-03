Class {
	#name : #SkiaScalePush,
	#superclass : #SkiaTransformationPush,
	#instVars : [
		'scaleX',
		'scaleY'
	],
	#category : #'Sparta-Skia-Utilities'
}

{ #category : #accessing }
SkiaScalePush >> scaleX [
	^ scaleX
]

{ #category : #accessing }
SkiaScalePush >> scaleX: anObject [
	scaleX := anObject
]

{ #category : #accessing }
SkiaScalePush >> scaleY [
	^ scaleY
]

{ #category : #accessing }
SkiaScalePush >> scaleY: anObject [
	scaleY := anObject
]
