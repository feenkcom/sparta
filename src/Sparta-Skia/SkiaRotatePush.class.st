Class {
	#name : #SkiaRotatePush,
	#superclass : #SkiaTransformationPush,
	#instVars : [
		'x',
		'y',
		'degrees'
	],
	#category : #'Sparta-Skia-Utilities'
}

{ #category : #accessing }
SkiaRotatePush >> degrees [
	^ degrees
]

{ #category : #accessing }
SkiaRotatePush >> degrees: anObject [
	degrees := anObject
]

{ #category : #accessing }
SkiaRotatePush >> x [
	^ x
]

{ #category : #accessing }
SkiaRotatePush >> x: anObject [
	x := anObject
]

{ #category : #accessing }
SkiaRotatePush >> y [
	^ y
]

{ #category : #accessing }
SkiaRotatePush >> y: anObject [
	y := anObject
]
