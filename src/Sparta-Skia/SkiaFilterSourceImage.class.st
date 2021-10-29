Class {
	#name : #SkiaFilterSourceImage,
	#superclass : #SkiaFilterSource,
	#instVars : [
		'image'
	],
	#category : 'Sparta-Skia-Filters'
}

{ #category : #accessing }
SkiaFilterSourceImage >> image [
	^ image
]

{ #category : #accessing }
SkiaFilterSourceImage >> image: anObject [
	image := anObject
]

{ #category : #testing }
SkiaFilterSourceImage >> isImage [
	^ true
]
