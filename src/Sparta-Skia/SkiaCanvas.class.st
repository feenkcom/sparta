Class {
	#name : #SkiaCanvas,
	#superclass : #SpartaCanvas,
	#instVars : [
		'skiaSurface',
		'skiaSurfaceCanvas'
	],
	#category : #'Sparta-Skia-Core'
}

{ #category : #initialization }
SkiaCanvas >> initializeWith: aSkiaSurface [
	skiaSurface := aSkiaSurface.
	skiaSurfaceCanvas := skiaSurface canvas
]
