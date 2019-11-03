Class {
	#name : #SkiaTranslationPush,
	#superclass : #SkiaTransformationPush,
	#instVars : [
		'x',
		'y'
	],
	#category : #'Sparta-Skia-Utilities'
}

{ #category : #accessing }
SkiaTranslationPush >> x [
	^ x
]

{ #category : #accessing }
SkiaTranslationPush >> x: anObject [
	x := anObject
]

{ #category : #accessing }
SkiaTranslationPush >> y [
	^ y
]

{ #category : #accessing }
SkiaTranslationPush >> y: anObject [
	y := anObject
]
