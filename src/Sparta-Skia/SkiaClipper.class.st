Class {
	#name : #SkiaClipper,
	#superclass : #SpartaClipper,
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
	<return: #SpartaRectangle>

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
SkiaClipper >> pushCircle: aSpartaCircle [
	canvas surfaceCanvas
		save;
		clipCircle: aSpartaCircle
]

{ #category : #'private - clipping' }
SkiaClipper >> pushPath: aSpartaPath [
	canvas surfaceCanvas
		save;
		clipPath: aSpartaPath
]

{ #category : #'private - clipping' }
SkiaClipper >> pushRectangle: aRectangle [
	canvas surfaceCanvas
		save;
		clipRectangle: aRectangle
]

{ #category : #'private - clipping' }
SkiaClipper >> pushRoundedRectangle: aSpartaRoundedRectangle [
	canvas surfaceCanvas
		save;
		clipRoundedRectangle: aSpartaRoundedRectangle
]
