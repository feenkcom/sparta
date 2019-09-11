Class {
	#name : #MozCanvas,
	#superclass : #SpartaCanvas,
	#traits : 'TMozLibrary + TMozRefPtr + TMozDebug',
	#classTraits : 'TMozLibrary classTrait + TMozRefPtr classTrait + TMozDebug classTrait',
	#instVars : [
		'handle',
		'fillPainter',
		'filterPainter',
		'maskPainter',
		'patternBuilder',
		'paintProvider',
		'clipBuilder',
		'bitmapBuilder',
		'shapeFactory',
		'fontFaceBuilder'
	],
	#pools : [
		'MozSharedPool'
	],
	#category : 'Sparta-Moz2D'
}

{ #category : #converting }
MozCanvas class >> asExternalTypeOn: generator [
	"use handle ivar to hold my instance (Moz2DCanvas)"
	^ FFIExternalObjectType objectClass: self
]

{ #category : #'instance creation' }
MozCanvas class >> checker: anExtent [
	|canvas checker|
	canvas := self extent: anExtent.
	
	checker := MozCanvas extent: 20@20.
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
		draw.
	
	^ canvas
]

{ #category : #'instance creation' }
MozCanvas class >> createExtent: aPoint format: aSurfaceFormat [
	^ (self
		primCreateWidth: aPoint x
		height: aPoint y
		format: aSurfaceFormat) 
			initialize;
			autoRelease
]

{ #category : #'instance creation' }
MozCanvas class >> createForData: aData extent: aPoint stride: stride format: aSurfaceFormat [
	^ (self
		primCreateForData: aData
		width: aPoint x
		height: aPoint y
		stride: stride
		format: aSurfaceFormat)
			initialize;
			autoRelease
]

{ #category : #'instance creation' }
MozCanvas class >> createForData: aData type: aBackendType extent: aPoint stride: stride format: aSurfaceFormat [
	^ (self
		primCreateForData: aBackendType
		data: aData
		width: aPoint x
		height: aPoint y
		stride: stride
		format: aSurfaceFormat
		uninitialized: false)
			initialize;
			autoRelease
]

{ #category : #'instance creation' }
MozCanvas class >> createType: aBackendType extent: aPoint format: aSurfaceFormat [
	^ (self
		primCreate: aBackendType
		width: aPoint x
		height: aPoint y
		format: aSurfaceFormat)
			initialize;
			autoRelease
]

{ #category : #accessing }
MozCanvas class >> drawOptions [
	^ MozDrawOptions
]

{ #category : #'api - instance creation' }
MozCanvas class >> extent: aPoint [
	^ (self
		primCreateWidth: aPoint x
		height: aPoint y
		format: MozSurfaceFormat B8G8R8A8)
			initialize;
			autoRelease
]

{ #category : #'api - instance creation' }
MozCanvas class >> pdf: aFileName extent: aPoint [
	^ MozPdfCanvas createFor: aFileName extent: aPoint
]

{ #category : #'private - ffi' }
MozCanvas class >> primCreate: aBackendType width: width height: height format: aSurfaceFormat [

	^ self ffiCall: #( #MozCanvas moz2d_draw_target_create_type (
		MozBackendType aBackendType,
		int32 width,
		int32 height,
		MozSurfaceFormat aSurfaceFormat) )
]

{ #category : #'private - ffi' }
MozCanvas class >> primCreateForData: aBackendType data: aData width: width height: height stride: stride format: aSurfaceFormat uninitialized: Uninitialized [

	^ self ffiCall: #( #MozCanvas moz2d_draw_target_create_for_data_type (
		MozBackendType aBackendType,
		void* aData,
		int32 width,
		int32 height,
		int32 stride,
		MozSurfaceFormat aSurfaceFormat,
		bool Uninitialized) )
]

{ #category : #'private - ffi' }
MozCanvas class >> primCreateForData: aData width: width height: height stride: stride format: aSurfaceFormat [

	^ self ffiCall: #( MozCanvas moz2d_draw_target_create_for_data (
		void* aData,
		int32 width,
		int32 height,
		int32 stride,
		MozSurfaceFormat aSurfaceFormat) )
]

{ #category : #'private - ffi' }
MozCanvas class >> primCreateWidth: width height: height format: aSurfaceFormat [

	^ self ffiCall: #( #MozCanvas moz2d_draw_target_create (
		int32 width,
		int32 height,
		MozSurfaceFormat aSurfaceFormat) )
]

{ #category : #accessing }
MozCanvas class >> strokeOptions [
	^ MozStrokeOptions
]

{ #category : #'api - instance creation' }
MozCanvas class >> svg: aFileName extent: aPoint [
	^ MozSvgCanvas createFor: aFileName extent: aPoint
]

{ #category : #filters }
MozCanvas >> arithmeticCombineFilter [
	^ MozArithmeticCombineFilter createOn: self
]

{ #category : #converting }
MozCanvas >> asForm [
	| form |

	form := Form extent: self extent depth: 32.
	form unhibernate.
	self flush.
	self primAsForm: form bits.
	^ form
]

{ #category : #'private - ffi' }
MozCanvas >> autoRelease [
	FFIExternalResourceManager addResource: self
]

{ #category : #accessing }
MozCanvas >> backendType [

	^ self primGetBackendType
]

{ #category : #builders }
MozCanvas >> bitmapBuilder [
	^ bitmapBuilder ifNil: [ bitmapBuilder := MozBitmapBuilder new ]
]

{ #category : #builders }
MozCanvas >> clipBuilder [
	^ clipBuilder ifNil: [ clipBuilder := MozClipper new ]
]

{ #category : #filters }
MozCanvas >> colorMatrixFilter [
	^ MozColorMatrixFilter createOn: self
]

{ #category : #filters }
MozCanvas >> compositeFilter [
	^ MozCompositeFilter createOn: self
]

{ #category : #filters }
MozCanvas >> convolveMatrixFilter [
	^ MozConvolveMatrixFilter createOn: self
]

{ #category : #converting }
MozCanvas >> data [

	^ self primData copyFrom: 1 to: self extent y * self stride.
]

{ #category : #filters }
MozCanvas >> diffuseDistantLightFilter [
	^ MozDiffuseDistantLightFilter createOn: self
]

{ #category : #filters }
MozCanvas >> diffusePointLightFilter [
	^ MozDiffusePointLightFilter createOn: self
]

{ #category : #filters }
MozCanvas >> diffuseSpotLightFilter [
	^ MozDiffuseSpotLightFilter createOn: self
]

{ #category : #filters }
MozCanvas >> discreteTransferFilter [
	^ MozDiscreteTransferFilter createOn: self
]

{ #category : #filters }
MozCanvas >> displacementMapFilter [
	^ MozDisplacementMapFilter createOn: self
]

{ #category : #'instance creation' }
MozCanvas >> drawOptions [
	^ self class drawOptions sample clone
		in: [ :aDrawOptions | composeOperators ifNotEmpty: [ :theOperators | aDrawOptions perform: theOperators top ] ];
		yourself
]

{ #category : #accessing }
MozCanvas >> extent [
	|externalSize|
	externalSize := MozNativeIntSize new.
	self primGetSize: externalSize.
	^ externalSize asPoint
]

{ #category : #builders }
MozCanvas >> fillPainter [
	^ fillPainter ifNil: [ fillPainter := MozFillPainter new ]
]

{ #category : #builders }
MozCanvas >> filterPainter [
	^ filterPainter ifNil: [ filterPainter := MozFilterPainter new ]
]

{ #category : #filters }
MozCanvas >> floodFilter [
	^ MozFloodFilter createOn: self
]

{ #category : #accessing }
MozCanvas >> flush [
	"Ensure that the backend has flushed all drawing operations to this canvas"
	self primFlush
]

{ #category : #builders }
MozCanvas >> fontBuilder [
	^ MozFontBuilder new
]

{ #category : #builders }
MozCanvas >> fontFaceBuilder [
	^ fontFaceBuilder ifNil: [ fontFaceBuilder := MozFontFaceBuilder new ]
]

{ #category : #filters }
MozCanvas >> gammaTransferFilter [
	^ MozGammaTransferFilter createOn: self
]

{ #category : #filters }
MozCanvas >> gaussianBlurFilter [
	^ MozGaussianBlurFilter createOn: self
]

{ #category : #'private - ffi' }
MozCanvas >> getHandle [
	^ handle
]

{ #category : #testing }
MozCanvas >> isAllowedSubpixelAA [

	^ self primIsSubpixelAAPermitted
]

{ #category : #testing }
MozCanvas >> isRecording [

	^ self primIsRecording
]

{ #category : #testing }
MozCanvas >> isValid [
	"Return true if canvas is correctly initialized (not a null pointer)
	and is actually valid that is determined by a backend"
	<return: #Boolean>

	^ handle isNull not and: [ self primIsValid ]
]

{ #category : #builders }
MozCanvas >> layerBuilder [
	^ MozLayerBuilder new
]

{ #category : #filters }
MozCanvas >> linearTransferFilter [
	^ MozLinearTransferFilter createOn: self
]

{ #category : #builders }
MozCanvas >> maskPainter [
	^ maskPainter ifNil: [ maskPainter := MozMaskPainter new ]
]

{ #category : #filters }
MozCanvas >> morphologyFilter [
	^ MozMorphologyFilter createOn: self
]

{ #category : #builders }
MozCanvas >> paintProvider [
	^ paintProvider ifNil: [ paintProvider := MozPaintProvider new ]
]

{ #category : #builders }
MozCanvas >> pathBuilder: aFillRuleSymbol [
	^ (self primCreatePathBuilder: (MozFillRule named: aFillRuleSymbol)) autoRelease
]

{ #category : #api }
MozCanvas >> pattern [
	^ self patternBuilder
		reset;
		canvas: self;
		yourself
]

{ #category : #builders }
MozCanvas >> patternBuilder [
	^ patternBuilder ifNil: [ patternBuilder := MozPatternBuilder new ]
]

{ #category : #accessing }
MozCanvas >> pixelFormat [

	^ self primGetSurfaceFormat
]

{ #category : #converting }
MozCanvas >> pixels [
	|data pixels extent stride p|
	extent := self extent.
	stride := self stride.
	
	data := self data.
	pixels := Array new: extent x * extent y.
	p := 0.
	1 to: extent y do: [ :y |
		1 to: extent x do: [ :x |
			| index color r g b a i|
			i := ((y - 1) * (stride / 4) + (x - 1)).
			index := i * 4 + 1.
			r := (data at: index + 2).
			g := (data at: index + 1).
			b := (data at: index + 0).
			a := (data at: index + 3).
			color := (Color r: r g: g b: b range: 255) alpha: a.
			p := p + 1.
			pixels at: p put: ((color bitPatternForDepth: 32) at: 1)
		]
	].
	^ pixels
]

{ #category : #'private - ffi' }
MozCanvas >> primAsForm: aPixelArray [

	^ self ffiCall: #(void moz2d_draw_target_as_form (self, void* aPixelArray))
]

{ #category : #'private - ffi' }
MozCanvas >> primCreatePathBuilder: aMozFillRule [
	^ self ffiCall: #(#MozPathBuilder moz2d_draw_target_create_path_builder(self, MozFillRule aMozFillRule))
]

{ #category : #'private - ffi' }
MozCanvas >> primCreateSimilarWidth: aWidth height: aHeight [

	^ self ffiCall: #(MozCanvas moz2d_draw_target_create_similar( self, int32 aWidth, int32 aHeight ))
]

{ #category : #'private - ffi' }
MozCanvas >> primData [
	^ self ffiCall: #( uint32 * moz2d_draw_target_get_data ( self ) )
]

{ #category : #'private - ffi' }
MozCanvas >> primDelete [

	^ self ffiCall: #( void moz2d_draw_target_delete( self ) )
]

{ #category : #'private - ffi' }
MozCanvas >> primFlush [
	^ self ffiCall: #(void moz2d_draw_target_flush (self))
]

{ #category : #'private - ffi - accessing' }
MozCanvas >> primGetBackendType [

	^ self ffiCall: #(MozBackendType moz2d_draw_target_get_backend_type ( self ) )
]

{ #category : #'private - ffi - accessing' }
MozCanvas >> primGetDrawTargetType [

	^ self ffiCall: #(MozDrawTargetType moz2d_draw_target_get_type ( self ) )
]

{ #category : #'private - ffi' }
MozCanvas >> primGetPermitSubpixelAA [

	^ self ffiCall: #(bool moz2d_draw_target_get_permit_subpixel_aa (self))
]

{ #category : #'private - ffi - accessing' }
MozCanvas >> primGetSize: aSize [

	^ self ffiCall: #(void moz2d_draw_target_get_size (self, MozNativeIntSize aSize ) )
]

{ #category : #'private - ffi - accessing' }
MozCanvas >> primGetStride [

	^ self ffiCall: #(int32 moz2d_draw_target_get_stride( self ) )
]

{ #category : #'private - ffi - accessing' }
MozCanvas >> primGetSurfaceFormat [

	^ self ffiCall: #(MozSurfaceFormat moz2d_draw_target_get_surface_format ( self ) )
]

{ #category : #'private - ffi - testing' }
MozCanvas >> primIsRecording [

	^ self ffiCall: #(bool moz2d_draw_target_is_recording ( self ) )
]

{ #category : #'private - ffi - testing' }
MozCanvas >> primIsSubpixelAAPermitted [

	^ self ffiCall: #(bool moz2d_draw_target_get_permit_subpixel_aa ( self ) )
]

{ #category : #'private - ffi - testing' }
MozCanvas >> primIsValid [

	^ self ffiCall: #(bool moz2d_draw_target_is_valid ( self ) )
]

{ #category : #'private - ffi' }
MozCanvas >> primPixelX: x y: y [

	^ self ffiCall: #(uint32 moz2d_draw_target_get_pixel (self, int32 x, int32 y))
]

{ #category : #'private - ffi' }
MozCanvas >> primSetPermitSubpixelAA: aBoolean [

	^ self ffiCall: #(void moz2d_draw_target_set_permit_subpixel_aa (self, bool aBoolean))
]

{ #category : #'private - ffi' }
MozCanvas >> primSnapshot [

	^ self ffiCall: #(MozSurface moz2d_draw_target_snapshot ( self ) )
]

{ #category : #printing }
MozCanvas >> printOn: aStream [

	handle isNull
		ifTrue: [ ^ aStream nextPutAll: 'nullptr'; cr ].

	aStream nextPutAll: self class name, ' ('; cr.
	aStream tab; nextPutAll: 'extent: ', self extent asString; cr.
	aStream tab; nextPutAll: 'raster: ', self rasterType item asString; cr.
	aStream tab; nextPutAll: 'type: ', self backendType item asString; cr.
	aStream tab; nextPutAll: 'format: ', self pixelFormat item asString; cr.
	aStream tab; nextPutAll: 'stride: ', self stride asString; cr.
	aStream tab; nextPutAll: 'valid: ', self isValid asString; cr.
	aStream tab; nextPutAll: 'recording: ', self isRecording asString; cr.
	aStream tab; nextPutAll: 'subpixel aa allowed: ', self isAllowedSubpixelAA asString; cr.
	aStream tab; nextPutAll: 'handle: ', handle asString; cr.
	aStream tab; nextPutAll: 'refCount: ', self refCount asString; cr.
	aStream nextPutAll: ')'; cr.
]

{ #category : #accessing }
MozCanvas >> rasterType [

	^ self primGetDrawTargetType
]

{ #category : #'private - ffi' }
MozCanvas >> resourceData [ 
	^ self getHandle
]

{ #category : #builders }
MozCanvas >> shadowPainter [
	^ MozShadowPainter new
]

{ #category : #builders }
MozCanvas >> shapeFactory [
	^ shapeFactory ifNil: [ shapeFactory := MozShapeFactory new ]
]

{ #category : #'instance creation' }
MozCanvas >> similar: anExtent [
	^ (self primCreateSimilarWidth: anExtent x height: anExtent y)
		initialize;
		autoRelease
]

{ #category : #filters }
MozCanvas >> specularDistantLightFilter [
	^ MozSpecularDistantLightFilter createOn: self
]

{ #category : #filters }
MozCanvas >> specularPointLightFilter [
	^ MozSpecularPointLightFilter createOn: self
]

{ #category : #filters }
MozCanvas >> specularSpotLightFilter [
	^ MozSpecularSpotLightFilter createOn: self
]

{ #category : #accessing }
MozCanvas >> stride [
	^ self primGetStride
]

{ #category : #'instance creation' }
MozCanvas >> strokeOptions [
	^ self class strokeOptions sample clone
]

{ #category : #builders }
MozCanvas >> strokePainter [
	^ MozStrokePainter new
]

{ #category : #accessing }
MozCanvas >> surface [
	"Return a snapshot of the surface.
	
	Every surface access increases refCount by one.
	On first call refCount equals 2, since surface is referenced by
	draw target, plus one our reference. As soon as surface is not
	referenced on image side its refCount must be decreased by one
	calling Release() on the reference within finalizeResourceData:"
	
	^ self primSnapshot autoRelease
]

{ #category : #filters }
MozCanvas >> tableTransferFilter [
	^ MozTableTransferFilter createOn: self
]

{ #category : #builders }
MozCanvas >> textPainter [
	^ MozTextPainter new
]

{ #category : #filters }
MozCanvas >> transformFilter [
	^ MozTransformFilter createOn: self
]

{ #category : #builders }
MozCanvas >> transformationBuilder [
	^ MozTransformationBuilder new
]

{ #category : #filters }
MozCanvas >> turbulenceFilter [
	^ MozTurbulenceFilter createOn: self
]
