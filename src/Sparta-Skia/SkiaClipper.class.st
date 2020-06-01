Class {
	#name : #SkiaClipper,
	#superclass : #SpartaClipper,
	#instVars : [
		'offset'
	],
	#category : #'Sparta-Skia-Builders'
}

{ #category : #testing }
SkiaClipper >> containsGlobal: aRectangle [
	<return: #Boolean>

	^ self globalBounds intersects: aRectangle
]

{ #category : #testing }
SkiaClipper >> containsLocal: aRectangle [
	<return: #Boolean>

	^ self localBounds intersects: aRectangle
]

{ #category : #geometry }
SkiaClipper >> globalBounds [
	<return: #Rectangle>

	^ canvas surfaceCanvas clipDeviceBounds
]

{ #category : #geometry }
SkiaClipper >> localBounds [
	<return: #Rectangle>

	^ canvas surfaceCanvas clipLocalBounds
]

{ #category : #'private - clipping' }
SkiaClipper >> pop [
	"I pop the previously pushed clip area.
	I am a part of the internal API and should not be used directly"

	canvas surfaceCanvas restore
]

{ #category : #'private - clipping' }
SkiaClipper >> push: aPath offset: anOffset [
	offset := anOffset.
	self push: aPath
]

{ #category : #'private - clipping' }
SkiaClipper >> pushCircle: aSpartaCircle [
	canvas surfaceCanvas
		save;
		clipCircle: aSpartaCircle offset: offset
]

{ #category : #'private - clipping' }
SkiaClipper >> pushPath: aSpartaPath [
	canvas surfaceCanvas
		save;
		clipPath: aSpartaPath offset: offset
]

{ #category : #'private - clipping' }
SkiaClipper >> pushRectangle: aRectangle [
	canvas surfaceCanvas
		save;
		clipRectangle: aRectangle offset: offset
]

{ #category : #'private - clipping' }
SkiaClipper >> pushRoundedRectangle: aSpartaRoundedRectangle [
	canvas surfaceCanvas
		save;
		clipRoundedRectangle: aSpartaRoundedRectangle offset: offset
]

{ #category : #'initialize-release' }
SkiaClipper >> reset [
	super reset.
	
	offset := 0@0
]
