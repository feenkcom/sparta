Class {
	#name : #SkiaCanvas,
	#superclass : #SpartaCanvas,
	#instVars : [
		'skiaSurface',
		'skiaSurfaceCanvas'
	],
	#category : #'Sparta-Skia-Core'
}

{ #category : #'api - instance creation' }
SkiaCanvas class >> extent: anExtent [
	^ self new initializeWith: (SkiaSurface newRasterPremultipled: anExtent)
]

{ #category : #converting }
SkiaCanvas >> asForm [
	^ self surface asForm
]

{ #category : #builders }
SkiaCanvas >> fillPainter [
	^ SkiaFillPainter new
]

{ #category : #initialization }
SkiaCanvas >> initializeWith: aSkiaSurface [
	skiaSurface := aSkiaSurface.
	skiaSurfaceCanvas := skiaSurface canvas
]

{ #category : #builders }
SkiaCanvas >> paintProvider [
	^ SkiaPaintProvider new
]

{ #category : #accessing }
SkiaCanvas >> surface [
	"Return a copy of a surface I used to draw on.
	A surface is a snapshot of my current drawing state.
	It can be used as paint, mask, as input source in a filter
	and can be blended differently on me or another canvas (with shadow,
	3d transformation, composition mode or directly)"
	<return: #TSpartaSurface>

	^ skiaSurface
]

{ #category : #accessing }
SkiaCanvas >> surfaceCanvas [
	<return: #SkiaSurfaceCanvas>

	 ^ skiaSurfaceCanvas
]
