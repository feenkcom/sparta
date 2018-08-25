Class {
	#name : #SpartaCairoCanvas,
	#superclass : #SpartaCanvas,
	#traits : 'TSpartaCairoLibrary + TSpartaCairoRefPtr + TSpartaCairoDebug',
	#classTraits : 'TSpartaCairoLibrary classTrait + TSpartaCairoRefPtr classTrait + TSpartaCairoDebug classTrait',
	#instVars : [
		'handle',
		'surface',
		'transformationStack',
		'layerStack'
	],
	#category : 'Sparta-Cairo'
}

{ #category : #converting }
SpartaCairoCanvas class >> asExternalTypeOn: generator [
	^ FFIExternalObjectType objectClass: self
]

{ #category : #'instance creation' }
SpartaCairoCanvas class >> checker: anExtent [
	|canvas checker|
	canvas := self extent: anExtent.
	canvas fill
		paint: Color white;
		path: canvas bounds;
		draw.
	
	"checker := MozCanvas extent: 20@20.
	checker fill
		paint: Color white;
		path: (0@0 extent: checker extent);
		draw;
		paint: Color veryVeryLightGray slightlyLighter slightlyLighter;
		path: (0@0 extent: checker extent / 2.0);
		draw;
		path: ((checker extent / 2.0) extent: checker extent / 2.0);
		draw.

	canvas fill
		paint: (canvas paint surface
			source: checker;
			repeat);
		path: (0@0 extent: canvas extent);
		draw."
	
	^ canvas
]

{ #category : #'instance creation' }
SpartaCairoCanvas class >> create: aSurface [

	^ (self primCreate: aSurface)
		initialize;
		surface: aSurface;
		autoRelease;
		yourself
]

{ #category : #'instance creation' }
SpartaCairoCanvas class >> createForData: aData extent: aPoint stride: stride format: aSurfaceFormat [
	| aSurface |
	
	aSurface := SpartaCairoImageSurface
		createForData: aData
		extent: aPoint
		stride: stride
		format: aSurfaceFormat.

	^ self create: aSurface
]

{ #category : #'instance creation' }
SpartaCairoCanvas class >> createForPdf: aFileName extent: aPoint [
	| aSurface |

	aSurface := SpartaCairoPdfSurface
		createExtent: aPoint
		fileNamed: aFileName.

	^ SpartaCairoPdfCanvas create: aSurface
]

{ #category : #'instance creation' }
SpartaCairoCanvas class >> createForSvg: aFileName extent: aPoint [
	| aSurface |

	aSurface := SpartaCairoSvgSurface
		createExtent: aPoint
		fileNamed: aFileName.

	^ SpartaCairoSvgCanvas create: aSurface
]

{ #category : #accessing }
SpartaCairoCanvas class >> drawOptions [
	^ SpartaCairoDrawOptions
]

{ #category : #'api - instance creation' }
SpartaCairoCanvas class >> extent: anExtent [
	| aSurface |
	
	aSurface := SpartaCairoImageSurface
		createExtent: anExtent
		format: SpartaCairoSurfaceFormat CAIRO_FORMAT_ARGB32.
	
	^ self create: aSurface
]

{ #category : #'api - instance creation' }
SpartaCairoCanvas class >> pdf: aFileName extent: aPoint [
	^ self createForPdf: aFileName extent: aPoint
]

{ #category : #'private - ffi' }
SpartaCairoCanvas class >> primAddRef: aHandle [

	^ self ffiCall: #( void cairo_reference ( void* aHandle ) )
]

{ #category : #'private - ffi' }
SpartaCairoCanvas class >> primCreate: aSurface [

	^ self ffiCall: #(SpartaCairoCanvas cairo_create (SpartaCairoSurface aSurface) )
]

{ #category : #'private - ffi' }
SpartaCairoCanvas class >> primRefCount: aHandle [

	^ self ffiCall: #(uint cairo_get_reference_count ( void* aHandle ) )
]

{ #category : #'private - ffi' }
SpartaCairoCanvas class >> primRelease: aHandle [

	^ self ffiCall: #(void cairo_destroy ( void* aHandle ) )
]

{ #category : #accessing }
SpartaCairoCanvas class >> strokeOptions [
	^ SpartaCairoStrokeOptions
]

{ #category : #'api - instance creation' }
SpartaCairoCanvas class >> svg: aFileName extent: aPoint [
	^ self createForSvg: aFileName extent: aPoint
]

{ #category : #converting }
SpartaCairoCanvas >> asForm [
	^ self surface asForm
]

{ #category : #'private - ffi' }
SpartaCairoCanvas >> autoRelease [
	FFIExternalResourceManager addResource: self
]

{ #category : #builders }
SpartaCairoCanvas >> bitmapBuilder [
	^ SpartaCairoBitmapBuilder new
]

{ #category : #builders }
SpartaCairoCanvas >> clipBuilder [
	^ SpartaCairoClipper new
]

{ #category : #accessing }
SpartaCairoCanvas >> extent [
	^ self surface extent
]

{ #category : #builders }
SpartaCairoCanvas >> fillPainter [
	^ SpartaCairoFillPainter new
]

{ #category : #builders }
SpartaCairoCanvas >> filterPainter [
	^ SpartaCairoFilterPainter new
]

{ #category : #accessing }
SpartaCairoCanvas >> flush [
	self surface flush
]

{ #category : #builders }
SpartaCairoCanvas >> fontBuilder [
	^ SpartaCairoFreetypeFontBuilder new
]

{ #category : #filters }
SpartaCairoCanvas >> gaussianBlurFilter [
	^ SpartaCairoGaussianBlurFilter new
]

{ #category : #'private - ffi' }
SpartaCairoCanvas >> getHandle [
	^ handle
]

{ #category : #initialization }
SpartaCairoCanvas >> initialize [
	super initialize.
	
	transformationStack := Stack new.
	layerStack := Stack new
]

{ #category : #testing }
SpartaCairoCanvas >> isValid [
	"Return true if canvas is correctly initialized (not a null pointer)
	and is actually valid that is determined by a backend"
	<return: #Boolean>

	^ handle isNull not
]

{ #category : #builders }
SpartaCairoCanvas >> layerBuilder [
	^ SpartaCairoLayerBuilder new
]

{ #category : #builders }
SpartaCairoCanvas >> paintProvider [
	^ SpartaCairoPaintProvider new
]

{ #category : #builders }
SpartaCairoCanvas >> pathBuilder: aFillRuleSymbol [
	^ SpartaCairoPathBuilder new fillRule: (SpartaCairoFillRule named: aFillRuleSymbol)
]

{ #category : #api }
SpartaCairoCanvas >> pattern [
	^ self patternBuilder
		reset;
		canvas: self;
		yourself
]

{ #category : #builders }
SpartaCairoCanvas >> patternBuilder [
	^ SpartaCairoPatternBuilder new
]

{ #category : #layers }
SpartaCairoCanvas >> popLayer [

	^ layerStack pop
]

{ #category : #transformation }
SpartaCairoCanvas >> popTransform [

	^ transformationStack pop
]

{ #category : #layers }
SpartaCairoCanvas >> pushLayer: aCairoLayer [

	layerStack push: aCairoLayer
]

{ #category : #transformation }
SpartaCairoCanvas >> pushTransform: aSpartaMatrix [

	transformationStack push: aSpartaMatrix
]

{ #category : #'private - ffi' }
SpartaCairoCanvas >> resourceData [ 
	^ self getHandle
]

{ #category : #builders }
SpartaCairoCanvas >> shapeFactory [
	^ SpartaCairoShapeFactory new
]

{ #category : #'instance creation' }
SpartaCairoCanvas >> similar: anExtent [
	"Create a new empty canvas of the same type and format with a given size.
	anExtent must not be nil"
	<return: #SpartaCanvas>

	^ self class extent: anExtent
]

{ #category : #accessing }
SpartaCairoCanvas >> stride [
	^ self surface stride
]

{ #category : #builders }
SpartaCairoCanvas >> strokePainter [
	^ SpartaCairoStrokePainter new
]

{ #category : #accessing }
SpartaCairoCanvas >> surface [
	^ surface
]

{ #category : #accessing }
SpartaCairoCanvas >> surface: aSurface [

	self
		assert: [ surface isNil ]
		description: [ 'Surface can only be assigned once' ].

	surface := aSurface
]

{ #category : #builders }
SpartaCairoCanvas >> textPainter [
	^ SpartaCairoTextPainter new
]

{ #category : #builders }
SpartaCairoCanvas >> transformationBuilder [
	^ SpartaCairoTransformationBuilder new
]
