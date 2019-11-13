"
When canvas is a source of a filter we should take its snapshot
"
Class {
	#name : #SkiaFilterSourceCanvas,
	#superclass : #SkiaFilterSource,
	#instVars : [
		'canvas'
	],
	#category : #'Sparta-Skia-Filters'
}

{ #category : #accessing }
SkiaFilterSourceCanvas >> canvas [
	^ canvas
]

{ #category : #accessing }
SkiaFilterSourceCanvas >> canvas: anObject [
	canvas := anObject
]

{ #category : #testing }
SkiaFilterSourceCanvas >> isCanvas [
	^ true
]
