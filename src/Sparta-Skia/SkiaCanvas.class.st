"
The following is an example of SkiaCanvas using a texture as a render target

aContext := GlutinContextBuilder headless.
aContext makeCurrent.

gl := aContext gl.

texture := GlutinGLTexture new.
texture id: gl gen_texture.
texture extent: 200@200.
texture formatRGBA8888.
texture internalFormatRGBA.
texture typeUInt8888.

gl bind_texture_2d: texture id.
gl
	tex_image_2d_level: 0
	internalformat: texture internalFormat
	width: texture width
	height: texture height
	border: 0
	format: texture internalFormat
	type: texture type
	pixels: nil
	length: 0.

textureInfo := (SkiaTextureInfo
	target: texture target
	id: texture id) format: texture format.
backendTexture := SkiaBackendTexture
	extent: texture extent
	mipMapped: true
	textureInfo: textureInfo.

canvas := SkiaCanvas
	createFromBackendTextureAsRenderTarget: backendTexture
	format: SkiaColorType RGBA8888.

canvas fill
	path: canvas bounds;
	paint: Color red;
	draw.

canvas flush.
canvas snapshot
"
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
SkiaCanvas class >> createForArrayU8: aGtBoxerArrayU8 extent: aPoint stride: aStride format: aSkiaColorType [
	"aGtBoxerArrayU8 must over-live the canvas"
	| anImageData aSurface |
	
	anImageData := SkiaImageInfo
		width: aPoint x
		height: aPoint y
		colorType: aSkiaColorType
		alphaType: SkiaAlphaType Premul.
	
	aSurface := SkiaSurface
		newRasterDirectImageInfo: anImageData
		pixels: aGtBoxerArrayU8
		stride: aStride.
		
	^ self new initializeWith: aSurface
]

{ #category : #'api - instance creation' }
SkiaCanvas class >> createForData: aData extent: aPoint stride: aStride format: aSkiaColorType [
	| anImageData aSurface thePixels |
	
	anImageData := SkiaImageInfo
		width: aPoint x
		height: aPoint y
		colorType: aSkiaColorType
		alphaType: SkiaAlphaType Premul.
	
	"GtBoxerArrayU8 does not own the data"
	thePixels := GtBoxerArrayU8 fromHandle: aData size: aStride * aPoint y.
	
	aSurface := SkiaSurface
		newRasterDirectImageInfo: anImageData
		pixels: thePixels
		stride: aStride.
		
	^ self new initializeWith: aSurface
]

{ #category : #'api - instance creation' }
SkiaCanvas class >> createFromBackendTexture: aSkiaBackendTexture format: aSkiaColorType [
	| aSurface |
		
	aSurface := SkiaSurface fromBackendTexture: aSkiaBackendTexture colorType: aSkiaColorType.
	^ self new initializeWith: aSurface
]

{ #category : #'api - instance creation' }
SkiaCanvas class >> createFromBackendTextureAsRenderTarget: aSkiaBackendTexture format: aSkiaColorType [
	| aSurface |
		
	aSurface := SkiaSurface fromBackendTextureAsRenderTarget: aSkiaBackendTexture colorType: aSkiaColorType.
	^ self new initializeWith: aSurface
]

{ #category : #'api - instance creation' }
SkiaCanvas class >> createFromRenderTarget: aSkiaBackendRenderTarget format: aSkiaColorType [
	| aSurface |
		
	aSurface := SkiaSurface fromRenderTarget: aSkiaBackendRenderTarget colorType: aSkiaColorType.
	^ self new initializeWith: aSurface
]

{ #category : #'api - instance creation' }
SkiaCanvas class >> createFromRenderTarget: aSkiaBackendRenderTarget format: aSkiaColorType context: anOpenGLContext [
	| aSurface |
		
	aSurface := SkiaSurface
		fromRenderTarget: aSkiaBackendRenderTarget
		colorType: aSkiaColorType
		context: anOpenGLContext.
	^ self new initializeWith: aSurface
]

{ #category : #'api - instance creation' }
SkiaCanvas class >> createNewRenderTargetExtent: aPoint format: aSkiaColorType [
	| anImageInfo aSurface |
	
	anImageInfo := SkiaImageInfo
		width: aPoint x
		height: aPoint y
		colorType: aSkiaColorType
		alphaType: SkiaAlphaType Premul.
	
	aSurface := SkiaSurface newRenderTargetImageInfo: anImageInfo.
		
	^ self new initializeWith: aSurface
]

{ #category : #accessing }
SkiaCanvas class >> drawOptions [
	^ SkiaDrawOptions
]

{ #category : #'private - examples' }
SkiaCanvas class >> exampleHeadlessFromTexture [
"textureSize := 400@400.

context := GlutinContextBuilder headless.
context makeCurrent.

gl := GtGleamGL loadGl: [ :aString | context getProcAddress: aString ].

framebuffer := gl gen_framebuffer.
gl bind_framebuffer: framebuffer target: gl GL_FRAMEBUFFER.

gl enable: gl GL_TEXTURE_2D.
texture := gl gen_texture.

gl bind_texture: texture target: gl GL_TEXTURE_2D.

gl
	tex_image_2d: gl GL_TEXTURE_2D
	level: 0
	internalFormat: gl GL_RGBA8
	width: textureSize x
	height: textureSize y
	border: 0
	format: gl GL_RGBA
	type: gl GL_UNSIGNED_INT_8_8_8_8_REV
	pixels: GtBoxerArrayU8 null.

gl tex_parameter_i: gl GL_TEXTURE_2D name: gl GL_TEXTURE_MAG_FILTER param: gl GL_NEAREST.
gl tex_parameter_i: gl GL_TEXTURE_2D name: gl GL_TEXTURE_MIN_FILTER param: gl GL_NEAREST.
gl tex_parameter_i: gl GL_TEXTURE_2D name: gl GL_TEXTURE_WRAP_S param: gl GL_CLAMP_TO_EDGE.
gl tex_parameter_i: gl GL_TEXTURE_2D name: gl GL_TEXTURE_WRAP_T param: gl GL_CLAMP_TO_EDGE.

depthbuffer := gl gen_renderbuffer.
gl bind_renderbuffer: depthbuffer target: gl GL_RENDERBUFFER.
gl
	renderbuffer_storage: gl GL_RENDERBUFFER
	internalFormat: gl GL_DEPTH_COMPONENT
	width: textureSize x
	height: textureSize y.

gl
	framebuffer_renderbuffer: gl GL_FRAMEBUFFER
	attachment: gl GL_DEPTH_ATTACHMENT
	renderbufferTarget: gl GL_RENDERBUFFER
	renderbuffer: depthbuffer.

gl
	framebuffer_texture_2d: gl GL_FRAMEBUFFER
	attachment: gl GL_COLOR_ATTACHMENT0
	textureTarget: gl GL_TEXTURE_2D
	texture: texture
	level: 0.
	
self assert: (gl check_frame_buffer_status: gl GL_FRAMEBUFFER) equals: gl GL_FRAMEBUFFER_COMPLETE.

gl disable: gl GL_FRAMEBUFFER_SRGB. 
gl disable: gl GL_MULTISAMPLE. 
gl disable: gl GL_POLYGON_SMOOTH. 

gl viewport: (0@0 extent: textureSize).
gl clear_color: Color magenta.
gl clear: gl GL_COLOR_BUFFER_BIT.
gl clear_depth: 0.
gl clear: gl GL_DEPTH_BUFFER_BIT.

gl delete_framebuffer: framebuffer.
gl delete_renderbuffer: depthbuffer.
gl active_texture: 0.
gl bind_texture: 0 target: gl GL_TEXTURE_2D.
gl bind_framebuffer: 0 target: gl GL_FRAMEBUFFER.
gl bind_renderbuffer: 0 target: gl GL_RENDERBUFFER.

canvas := SkiaCanvas
	createFromBackendTexture: (SkiaBackendTexture
		extent: textureSize
		mipMapped: false
		textureInfo: ((SkiaTextureInfo target: gl GL_TEXTURE_2D id: texture) format: gl GL_RGBA8))
	format: SkiaColorType RGBA8888.
	
canvas"



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
			ifFalse: [ offscreen := self extent: 1@1 ] ]
]

{ #category : #'api - instance creation' }
SkiaCanvas class >> recording: aRectangle [
	^ self new initializeWith: (SkiaPictureRecorder new bounds: aRectangle)
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
SkiaCanvas >> batchProcessor [
	^ SkiaBatcher new
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

{ #category : #builders }
SkiaCanvas >> fontFaceBuilder [
	^ SkiaFontFaceBuilder new
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

{ #category : #dependencies }
SkiaCanvas >> release [
	skiaSurfaceCanvas release.
	skiaSurfaceCanvas := nil.
	skiaSurface release.
	skiaSurface := nil 
]

{ #category : #builders }
SkiaCanvas >> shapeFactory [
	<return: #SpartaShapeFactory>

	^ SkiaShapeFactory new
]

{ #category : #'instance creation' }
SkiaCanvas >> similar: anExtent [
	"Create a new empty canvas of the same type and format with a given size.
	anExtent must not be nil"
	<return: #SpartaCanvas>
	
	^ self class new initializeWith: (skiaSurface similar: anExtent)
]

{ #category : #'instance creation' }
SkiaCanvas >> similar: anExtent during: aBlock [
	"Create a new empty canvas of the same type and format with a given size.
	The canvas lives during evaluation of a given block
	anExtent must not be nil"
	
	^ skiaSurface similar: anExtent during: [ :aSimilarSurface |
		| aSimilarCanvas |

		aSimilarCanvas := self class new initializeWith: aSimilarSurface.
		[ aBlock value: aSimilarCanvas ] ensure: [ aSimilarCanvas release ] ]
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
SkiaCanvas >> snapshotDuring: aBlock [
	"I am similar to #snaphot but I guarantee that snapshot is not auto-released
	and is destroyed after evaluation of the block."

	skiaSurface snapshotDuring: aBlock
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
