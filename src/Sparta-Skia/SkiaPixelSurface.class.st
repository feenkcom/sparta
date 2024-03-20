Class {
	#name : #SkiaPixelSurface,
	#superclass : #SkiaSurface,
	#instVars : [
		'gpuContext'
	],
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaPixelSurface class >> fromBackendTexture: aSkiaBackendTexture colorType: aSkiaColorType [
	| aSkiaContext |

	aSkiaContext := SkiaDirectContext new.
	
	^ (self fromNativeHandle: (self primFromBackendTexture: aSkiaBackendTexture context: aSkiaContext colorType: aSkiaColorType))
		gpuContext: aSkiaContext
]

{ #category : #'instance creation' }
SkiaPixelSurface class >> fromRenderTarget: aSkiaBackendRenderTarget colorType: aSkiaColorType [
	| aSkiaContext |

	aSkiaContext := SkiaDirectContext new.
	
	^ (self fromNativeHandle: (self primFromRenderTarget: aSkiaBackendRenderTarget context: aSkiaContext colorType: aSkiaColorType))
		gpuContext: aSkiaContext
]

{ #category : #'instance creation' }
SkiaPixelSurface class >> fromRenderTarget: aSkiaBackendRenderTarget colorType: aSkiaColorType context: anOpenGLContext [
	| aSkiaInterface aSkiaContext |
	
	aSkiaInterface := SkiaInterface native.
	(aSkiaInterface isNull and: [ anOpenGLContext isValid ])
		ifTrue: [ aSkiaInterface := SkiaInterface load: [ :eachFunctionName |
			eachFunctionName = 'eglGetCurrentDisplay'
				ifTrue: [ ExternalAddress null ]
				ifFalse: [ anOpenGLContext getProcAddress: eachFunctionName ] ] ]. 

	aSkiaContext := SkiaDirectContext fromInterface: aSkiaInterface.
	
	^ (self fromNativeHandle: (self primFromRenderTarget: aSkiaBackendRenderTarget context: aSkiaContext colorType: aSkiaColorType))
		gpuContext: aSkiaContext
]

{ #category : #'instance creation' }
SkiaPixelSurface class >> fromRenderTarget: aSkiaBackendRenderTarget colorType: aSkiaColorType directContext: aSkiaContext [	
	^ self fromNativeHandle: (self primFromRenderTarget: aSkiaBackendRenderTarget context: aSkiaContext colorType: aSkiaColorType)
]

{ #category : #'instance creation' }
SkiaPixelSurface class >> newRasterDirectImageInfo: aSkiaImageInfo pixels: thePixels stride: aStride [
	^ self fromNativeHandle: (self primNewRasterDirectImageInfo: aSkiaImageInfo pixels: thePixels stride: aStride)
]

{ #category : #'instance creation' }
SkiaPixelSurface class >> newRasterPremultipled: anExtent [
	| anIntegerExtent |
	
	anIntegerExtent := anExtent ceiling.
	^ self fromNativeHandle: (self primNewRaster32PremultipliedWidth: anIntegerExtent x height: anIntegerExtent y)
]

{ #category : #'instance creation' }
SkiaPixelSurface class >> newRenderTarget: aDirectContext imageInfo: aSkiaImageInfo [
	^ self fromNativeHandle: (self primNewRenderTargetContext: aDirectContext imageInfo: aSkiaImageInfo)
]

{ #category : #'instance creation' }
SkiaPixelSurface class >> newRenderTargetImageInfo: aSkiaImageInfo [
	| aSkiaDirectContext |

	aSkiaDirectContext := SkiaDirectContext new.

	^ (self newRenderTarget: aSkiaDirectContext imageInfo: aSkiaImageInfo)
		gpuContext: aSkiaDirectContext
]

{ #category : #'private - ffi' }
SkiaPixelSurface class >> primCreate [
	^ self ffiCall: #(void* skia_surface_new_default())
]

{ #category : #'private - ffi' }
SkiaPixelSurface class >> primFromBackendTexture: aSkiaBackendTexture context: aSkiaContext colorType: aSkiaColorType [
	^ self ffiCall: #(void* skia_surface_from_backend_texture(
		SkiaDirectContext aSkiaContext,
		SkiaBackendTexture aSkiaBackendTexture,
		SkiaColorType aSkiaColorType))
]

{ #category : #'private - ffi' }
SkiaPixelSurface class >> primFromRenderTarget: aSkiaBackendRenderTarget context: aSkiaContext colorType: aSkiaColorType [
	^ self ffiCall: #(void* skia_surface_from_render_target(
		SkiaBackendRenderTarget aSkiaBackendRenderTarget,
		SkiaDirectContext aSkiaContext,
		SkiaColorType aSkiaColorType))
]

{ #category : #'private - ffi' }
SkiaPixelSurface class >> primNewRaster32PremultipliedWidth: aWidth height: aHeight [
	^ self ffiCall: #(void* skia_surface_new_raster_n32_premul(int32 aWidth, int32 aHeight))
]

{ #category : #'private - ffi' }
SkiaPixelSurface class >> primNewRasterDirectImageInfo: aSkiaImageInfo pixels: thePixels stride: aStride [
	^ self ffiCall: #(void* skia_surface_new_raster_direct(
		SkiaImageInfo aSkiaImageInfo,
		GtBoxerArrayU8 thePixels,
		size_t aStride))
]

{ #category : #'private - ffi' }
SkiaPixelSurface class >> primNewRenderTargetContext: aSkiaContext imageInfo: aSkiaImageInfo [
	^ self ffiCall: #(void* skia_surface_new_render_target(
		SkiaImageInfo aSkiaImageInfo,
		SkiaDirectContext aSkiaContext))
	options: #(optEventLoop)
]

{ #category : #'private - ffi' }
SkiaPixelSurface class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_surface_drop(void* aHandle))
]

{ #category : #accessing }
SkiaPixelSurface >> alphaType [
	<return: #SkiaAlphaType>

	^ self primGetAlphaType
]

{ #category : #converting }
SkiaPixelSurface >> asForm [
	<return: #Form>
	
	^ self snapshot asForm
]

{ #category : #accessing }
SkiaPixelSurface >> canvas [
	<return: #SkiaSurfaceCanvas>
	| aCanvas |

	aCanvas := SkiaSurfaceCanvas fromNativeHandle: self primGetCanvas.
	aCanvas surface: self.
	^ aCanvas
]

{ #category : #accessing }
SkiaPixelSurface >> canvasDuring: aBlock [
	^ SkiaSurfaceCanvas
		fromNativeHandle: self primGetCanvas
		during: [ :aCanvas |
			aCanvas surface: self.
			aBlock value: aCanvas ]
]

{ #category : #accessing }
SkiaPixelSurface >> colorType [
	<return: #SkiaColorType>

	^ self primGetColorType
]

{ #category : #accessing }
SkiaPixelSurface >> data [
	<return: #GtBoxerArrayU8>
	| anImageInfo anArray |

	anImageInfo := self imageInfo.
	anArray := self ffiLibrary newArrayU8: anImageInfo byteSize withAll: 0.
	self primReadAllPixels: anArray.
	^ anArray
]

{ #category : #accessing }
SkiaPixelSurface >> flush [
	self primFlush.
	gpuContext ifNotNil: #flush
]

{ #category : #accessing }
SkiaPixelSurface >> gpuContext [
	^ gpuContext
]

{ #category : #accessing }
SkiaPixelSurface >> gpuContext: anObject [
	gpuContext := anObject
]

{ #category : #'gt-extension' }
SkiaPixelSurface >> gtInfoFor: aView [
	<gtView>

	^ (self imageInfo gtInfoFor: aView)
		title: 'Info';
		priority: 2
]

{ #category : #'gt-extension' }
SkiaPixelSurface >> gtPreviewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Preview';
		priority: 1;
		stencil: [ self asForm asElement ]
]

{ #category : #accessing }
SkiaPixelSurface >> height [
	^ self primGetHeight
]

{ #category : #accessing }
SkiaPixelSurface >> imageInfo [
	<return: #SkiaImageInfo>

	^ SkiaImageInfo fromNativeHandle: self primGetImageInfo
]

{ #category : #'private - ffi' }
SkiaPixelSurface >> primFlush [
	self
		ffiCall: #(void skia_surface_flush(self))
		options: #(optEventLoop)
]

{ #category : #'private - ffi' }
SkiaPixelSurface >> primGetAlphaType [
	^ self ffiCall: #(SkiaAlphaType skia_surface_get_alpha_type(self))
]

{ #category : #'private - ffi' }
SkiaPixelSurface >> primGetCanvas [
	^ self ffiCall: #(void* skia_surface_get_canvas(self))
]

{ #category : #'private - ffi' }
SkiaPixelSurface >> primGetColorType [
	^ self ffiCall: #(SkiaColorType skia_surface_get_color_type(self))
]

{ #category : #'private - ffi' }
SkiaPixelSurface >> primGetHeight [
	^ self ffiCall: #(int32 skia_surface_get_height(self))
]

{ #category : #'private - ffi' }
SkiaPixelSurface >> primGetImageInfo [
	^ self ffiCall: #(void* skia_surface_get_image_info(self))
]

{ #category : #'private - ffi' }
SkiaPixelSurface >> primGetImageSnapshot [
	^ self ffiCall: #(void* skia_surface_get_image_snapshot(self))
]

{ #category : #'private - ffi' }
SkiaPixelSurface >> primGetWidth [
	^ self ffiCall: #(int32 skia_surface_get_width(self))
]

{ #category : #'private - ffi' }
SkiaPixelSurface >> primNewSimilar: aSkiaImageInfo [
	^ self ffiCall: #(void* skia_surface_new_similar(self, SkiaImageInfo aSkiaImageInfo))
]

{ #category : #'private - ffi' }
SkiaPixelSurface >> primReadAllPixels: aBoxerArrayU8 [
	^ self ffiCall: #(bool skia_surface_read_all_pixels(self, GtBoxerArrayU8 aBoxerArrayU8))
]

{ #category : #accessing }
SkiaPixelSurface >> similar: anExtent [
	| anIntegerExtent |
	
	anIntegerExtent := anExtent ceiling asIntegerPoint.
	^ SkiaImageInfo
		width: anIntegerExtent x
		height: anIntegerExtent y
		colorType: self colorType
		alphaType: self alphaType
		during: [ :aSkiaImageInfo | SkiaPixelSurface fromNativeHandle: (self primNewSimilar: aSkiaImageInfo) ]
]

{ #category : #accessing }
SkiaPixelSurface >> similar: anExtent during: aBlock [
	| anIntegerExtent |
	
	anIntegerExtent := anExtent ceiling asIntegerPoint.
	
	^ SkiaImageInfo
		width: anIntegerExtent x
		height: anIntegerExtent y
		colorType: self colorType
		alphaType: self alphaType
		during: [ :aSkiaImageInfo |
			SkiaPixelSurface fromNativeHandle: (self primNewSimilar: aSkiaImageInfo) during: aBlock ]
]

{ #category : #accessing }
SkiaPixelSurface >> snapshot [
	<return: #SkiaImage>

	^ SkiaImage fromNativeHandle: self primGetImageSnapshot
]

{ #category : #accessing }
SkiaPixelSurface >> snapshotDuring: aBlock [
	^ SkiaImage fromNativeHandle: self primGetImageSnapshot during: aBlock
]

{ #category : #accessing }
SkiaPixelSurface >> width [
	^ self primGetWidth
]
