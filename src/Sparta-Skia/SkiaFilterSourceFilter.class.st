Class {
	#name : #SkiaFilterSourceFilter,
	#superclass : #SkiaFilterSource,
	#instVars : [
		'filter'
	],
	#category : #'Sparta-Skia-Filters'
}

{ #category : #accessing }
SkiaFilterSourceFilter >> filter [
	^ filter
]

{ #category : #accessing }
SkiaFilterSourceFilter >> filter: anObject [
	filter := anObject
]
