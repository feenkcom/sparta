Class {
	#name : #SkiaCanvas,
	#superclass : #SpartaCanvas,
	#instVars : [
		'skiaSurface',
		'skiaSurfaceCanvas'
	],
	#category : #'Sparta-Skia-Core'
}

{ #category : #accessing }
SkiaCanvas class >> drawOptions [
	^ SkiaDrawOptions
]

{ #category : #'api - instance creation' }
SkiaCanvas class >> extent: anExtent [
	^ self new initializeWith: (SkiaSurface newRasterPremultipled: anExtent)
]

{ #category : #accessing }
SkiaCanvas class >> strokeOptions [
	^ SkiaStrokeOptions
]

{ #category : #converting }
SkiaCanvas >> asForm [
	^ self surface asForm
]

{ #category : #builders }
SkiaCanvas >> clipBuilder [
	"Return a new instance of the backend specific ${class:SpartaClipper}$"

	^ SkiaClipper new
]

{ #category : #accessing }
SkiaCanvas >> extent [
	"Return my extent as point (width @ height).
	extent can not be nil"
	<return: #Point>
	
	^ skiaSurface extent
]

{ #category : #builders }
SkiaCanvas >> fillPainter [
	^ SkiaFillPainter new
]

{ #category : #builders }
SkiaCanvas >> fontBuilder [
	<return: #SpartaFontBuilder>
	^ SkiaFontBuilder new
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

{ #category : #builders }
SkiaCanvas >> pathBuilderClass [
	^ SkiaPathBuilder
]

{ #category : #builders }
SkiaCanvas >> strokePainter [
	^ SkiaStrokePainter new
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

{ #category : #builders }
SkiaCanvas >> transformationBuilder [
	"Return a new instance of the backend specific ${class:SpartaTransformationBuilder}$"

	^ SkiaTransformationBuilder new
]
