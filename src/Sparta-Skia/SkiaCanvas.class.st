Class {
	#name : #SkiaCanvas,
	#superclass : #SpartaCanvas,
	#instVars : [
		'skiaSurface',
		'skiaSurfaceCanvas',
		'session'
	],
	#classInstVars : [
		'offscreen'
	],
	#category : #'Sparta-Skia-Core'
}

{ #category : #'api - instance creation' }
SkiaCanvas class >> createForData: aData extent: aPoint stride: aStride format: aSkiaColorType [
	| anImageData aSurface thePixels |
	
	anImageData := SkiaImageInfo
		width: aPoint x
		height: aPoint y
		colorType: aSkiaColorType
		alphaType: SkiaAlphaType Unpremul.
	
	thePixels := GtBoxerArrayU8 fromHandle: aData size: aStride * aPoint y.
	
	aSurface := SkiaSurface
		newRasterDirectImageInfo: anImageData
		pixels: thePixels
		stride: aStride.
		
	^ self new initializeWith: aSurface
]

{ #category : #accessing }
SkiaCanvas class >> drawOptions [
	^ SkiaDrawOptions
]

{ #category : #'api - instance creation' }
SkiaCanvas class >> extent: anExtent [
	^ self new initializeWith: (SkiaSurface newRasterPremultipled: anExtent)
]

{ #category : #accessing }
SkiaCanvas class >> offscreen [
	^ offscreen
		ifNil: [ offscreen := self extent: 1@1 ]
		ifNotNil: [ :aCanvas | aCanvas isValid
			ifTrue: [ offscreen ]
			ifFalse: [ offscreen := self new ] ]
]

{ #category : #accessing }
SkiaCanvas class >> strokeOptions [
	^ SkiaStrokeOptions
]

{ #category : #converting }
SkiaCanvas >> asForm [
	^ self snapshot asForm
]

{ #category : #builders }
SkiaCanvas >> bitmapBuilder [
	^ SkiaBitmapBuilder new
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
SkiaCanvas >> filterPainter [
	^ SkiaFilterPainter new
]

{ #category : #builders }
SkiaCanvas >> filtersFactory [
	^ SkiaFiltersFactory new
]

{ #category : #accessing }
SkiaCanvas >> flush [
	"Ensure that the backend has flushed all drawing operations to this canvas"

	skiaSurfaceCanvas flush
]

{ #category : #builders }
SkiaCanvas >> fontBuilder [
	<return: #SpartaFontBuilder>
	^ SkiaFontBuilder new
]

{ #category : #initialization }
SkiaCanvas >> initializeWith: aSkiaSurface [
	skiaSurface := aSkiaSurface.
	skiaSurfaceCanvas := skiaSurface canvas.
	session := Smalltalk session
]

{ #category : #testing }
SkiaCanvas >> isValid [
	"Return true if canvas is correctly initialized (not a null pointer)
	and is actually valid that is determined by a backend"
	<return: #Boolean>

	^ session == Smalltalk session
		and: [ skiaSurface isNull not
			and: [ skiaSurfaceCanvas isNull not ] ]
]

{ #category : #builders }
SkiaCanvas >> layerBuilder [
	"Return a new instance of the backend specific ${class:SpartaLayerBuilder}$"

	^ SkiaLayerBuilder new
]

{ #category : #builders }
SkiaCanvas >> paintProvider [
	^ SkiaPaintProvider new
]

{ #category : #builders }
SkiaCanvas >> pathBuilderClass [
	^ SkiaPathBuilder
]

{ #category : #'instance creation' }
SkiaCanvas >> similar: anExtent [
	"Create a new empty canvas of the same type and format with a given size.
	anExtent must not be nil"
	<return: #SpartaCanvas>

	^ self class extent: anExtent
]

{ #category : #accessing }
SkiaCanvas >> snapshot [
	"Return a copy of a surface I used to draw on.
	A surface is a snapshot of my current drawing state.
	It can be used as paint, mask, as input source in a filter
	and can be blended differently on me or another canvas (with shadow,
	3d transformation, composition mode or directly)"
	<return: #TSpartaSurface>

	^ skiaSurface snapshot
]

{ #category : #accessing }
SkiaCanvas >> stride [
	<return: #Number>

	^ skiaSurface imageInfo minRowBytes
]

{ #category : #builders }
SkiaCanvas >> strokePainter [
	^ SkiaStrokePainter new
]

{ #category : #accessing }
SkiaCanvas >> surfaceCanvas [
	<return: #SkiaSurfaceCanvas>

	 ^ skiaSurfaceCanvas
]

{ #category : #builders }
SkiaCanvas >> textPainter [
	<return: #SpartaTextPainter>
	^ SkiaTextPainter new
]

{ #category : #builders }
SkiaCanvas >> transformationBuilder [
	"Return a new instance of the backend specific ${class:SpartaTransformationBuilder}$"

	^ SkiaTransformationBuilder new
]
