Class {
	#name : #SkiaSurface,
	#superclass : #SkiaExternalObject,
	#traits : 'TSpartaSurface',
	#classTraits : 'TSpartaSurface classTrait',
	#instVars : [
		'gpuContext'
	],
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaSurface class >> fromBackendTexture: aSkiaBackendTexture colorType: aSkiaColorType [
	| aSkiaContext |

	aSkiaContext := SkiaDirectContext new.
	
	^ (self fromNativeHandle: (self primFromBackendTexture: aSkiaBackendTexture context: aSkiaContext colorType: aSkiaColorType))
		gpuContext: aSkiaContext
]

{ #category : #'instance creation' }
SkiaSurface class >> fromRenderTarget: aSkiaBackendRenderTarget colorType: aSkiaColorType [
	| aSkiaContext |

	aSkiaContext := SkiaDirectContext new.
	
	^ (self fromNativeHandle: (self primFromRenderTarget: aSkiaBackendRenderTarget context: aSkiaContext colorType: aSkiaColorType))
		gpuContext: aSkiaContext
]

{ #category : #'instance creation' }
SkiaSurface class >> fromRenderTarget: aSkiaBackendRenderTarget colorType: aSkiaColorType context: anOpenGLContext [
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
SkiaSurface class >> fromRenderTarget: aSkiaBackendRenderTarget colorType: aSkiaColorType directContext: aSkiaContext [	
	^ self fromNativeHandle: (self primFromRenderTarget: aSkiaBackendRenderTarget context: aSkiaContext colorType: aSkiaColorType)
]

{ #category : #'instance creation' }
SkiaSurface class >> newRasterDirectImageInfo: aSkiaImageInfo pixels: thePixels stride: aStride [
	^ self fromNativeHandle: (self primNewRasterDirectImageInfo: aSkiaImageInfo pixels: thePixels stride: aStride)
]

{ #category : #'instance creation' }
SkiaSurface class >> newRasterPremultipled: anExtent [
	| anIntegerExtent |
	
	anIntegerExtent := anExtent ceiling.
	^ self fromNativeHandle: (self primNewRaster32PremultipliedWidth: anIntegerExtent x height: anIntegerExtent y)
]

{ #category : #'instance creation' }
SkiaSurface class >> newRenderTarget: aDirectContext imageInfo: aSkiaImageInfo [
	^ self fromNativeHandle: (self primNewRenderTargetContext: aDirectContext imageInfo: aSkiaImageInfo)
]

{ #category : #'instance creation' }
SkiaSurface class >> newRenderTargetImageInfo: aSkiaImageInfo [
	| aSkiaDirectContext |

	aSkiaDirectContext := SkiaDirectContext new.

	^ (self newRenderTarget: aSkiaDirectContext imageInfo: aSkiaImageInfo)
		gpuContext: aSkiaDirectContext
]

{ #category : #'private - ffi' }
SkiaSurface class >> primCreate [
	^ self ffiCall: #(void* skia_surface_new_default())
]

{ #category : #'private - ffi' }
SkiaSurface class >> primFromBackendTexture: aSkiaBackendTexture context: aSkiaContext colorType: aSkiaColorType [
	^ self ffiCall: #(void* skia_surface_from_backend_texture(
		SkiaDirectContext aSkiaContext,
		SkiaBackendTexture aSkiaBackendTexture,
		SkiaColorType aSkiaColorType))
]

{ #category : #'private - ffi' }
SkiaSurface class >> primFromRenderTarget: aSkiaBackendRenderTarget context: aSkiaContext colorType: aSkiaColorType [
	^ self ffiCall: #(void* skia_surface_from_render_target(
		SkiaBackendRenderTarget aSkiaBackendRenderTarget,
		SkiaDirectContext aSkiaContext,
		SkiaColorType aSkiaColorType))
]

{ #category : #'private - ffi' }
SkiaSurface class >> primNewRaster32PremultipliedWidth: aWidth height: aHeight [
	^ self ffiCall: #(void* skia_surface_new_raster_n32_premul(int32 aWidth, int32 aHeight))
]

{ #category : #'private - ffi' }
SkiaSurface class >> primNewRasterDirectImageInfo: aSkiaImageInfo pixels: thePixels stride: aStride [
	^ self ffiCall: #(void* skia_surface_new_raster_direct(
		SkiaImageInfo aSkiaImageInfo,
		GtBoxerArrayU8 thePixels,
		size_t aStride))
]

{ #category : #'private - ffi' }
SkiaSurface class >> primNewRenderTargetContext: aSkiaContext imageInfo: aSkiaImageInfo [
	^ self ffiCall: #(void* skia_surface_new_render_target(
		SkiaImageInfo aSkiaImageInfo,
		SkiaDirectContext aSkiaContext))
	options: #(optEventLoop)
]

{ #category : #'private - ffi' }
SkiaSurface class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_surface_drop(void* aHandle))
]

{ #category : #accessing }
SkiaSurface >> alphaType [
	<return: #SkiaAlphaType>

	^ self primGetAlphaType
]

{ #category : #converting }
SkiaSurface >> asForm [
	<return: #Form>
	
	^ self snapshot asForm
]

{ #category : #accessing }
SkiaSurface >> canvas [
	<return: #SkiaSurfaceCanvas>
	| aCanvas |

	aCanvas := SkiaSurfaceCanvas fromNativeHandle: self primGetCanvas.
	aCanvas surface: self.
	^ aCanvas
]

{ #category : #accessing }
SkiaSurface >> canvasDuring: aBlock [
	^ SkiaSurfaceCanvas
		fromNativeHandle: self primGetCanvas
		during: [ :aCanvas |
			aCanvas surface: self.
			aBlock value: aCanvas ]
]

{ #category : #accessing }
SkiaSurface >> colorType [
	<return: #SkiaColorType>

	^ self primGetColorType
]

{ #category : #accessing }
SkiaSurface >> data [
	<return: #GtBoxerArrayU8>
	| anImageInfo anArray |
	
	anImageInfo := self imageInfo.
	anArray := GtBoxerArrayU8 new: anImageInfo byteSize withAll: 0.
	self primReadAllPixels: anArray.
	^ anArray
]

{ #category : #accessing }
SkiaSurface >> extent [
	"Return my extent as point (width @ height).
	extent can not be nil"
	<return: #Point>
	| aWidth aHeight |
	
	aWidth := self primGetWidth.
	aHeight := self primGetHeight. 

	^ aWidth @ aHeight
]

{ #category : #accessing }
SkiaSurface >> flush [
	self primFlush.
	gpuContext ifNotNil: #flush
]

{ #category : #accessing }
SkiaSurface >> gpuContext [
	^ gpuContext
]

{ #category : #accessing }
SkiaSurface >> gpuContext: anObject [
	gpuContext := anObject
]

{ #category : #'gt-extension' }
SkiaSurface >> gtInfoFor: aView [
	<gtView>

	^ (self imageInfo gtInfoFor: aView)
		title: 'Info';
		priority: 2
]

{ #category : #'gt-extension' }
SkiaSurface >> gtPreviewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Preview';
		priority: 1;
		stencil: [ self asForm asElement ]
]

{ #category : #accessing }
SkiaSurface >> imageInfo [
	<return: #SkiaImageInfo>

	^ SkiaImageInfo fromNativeHandle: self primGetImageInfo
]

{ #category : #'private - ffi' }
SkiaSurface >> primFlush [
	self
		ffiCall: #(void skia_surface_flush(self))
		options: #(optEventLoop)
]

{ #category : #'private - ffi' }
SkiaSurface >> primGetAlphaType [
	^ self ffiCall: #(SkiaAlphaType skia_surface_get_alpha_type(self))
]

{ #category : #'private - ffi' }
SkiaSurface >> primGetCanvas [
	^ self ffiCall: #(void* skia_surface_get_canvas(self))
]

{ #category : #'private - ffi' }
SkiaSurface >> primGetColorType [
	^ self ffiCall: #(SkiaColorType skia_surface_get_color_type(self))
]

{ #category : #'private - ffi' }
SkiaSurface >> primGetHeight [
	^ self ffiCall: #(int32 skia_surface_get_height(self))
]

{ #category : #'private - ffi' }
SkiaSurface >> primGetImageInfo [
	^ self ffiCall: #(void* skia_surface_get_image_info(self))
]

{ #category : #'private - ffi' }
SkiaSurface >> primGetImageSnapshot [
	^ self ffiCall: #(void* skia_surface_get_image_snapshot(self))
]

{ #category : #'private - ffi' }
SkiaSurface >> primGetWidth [
	^ self ffiCall: #(int32 skia_surface_get_width(self))
]

{ #category : #'private - ffi' }
SkiaSurface >> primNewSimilar: aSkiaImageInfo [
	^ self ffiCall: #(void* skia_surface_new_similar(self, SkiaImageInfo aSkiaImageInfo))
]

{ #category : #'private - ffi' }
SkiaSurface >> primReadAllPixels: aBoxerArrayU8 [
	^ self ffiCall: #(bool skia_surface_read_all_pixels(self, GtBoxerArrayU8 aBoxerArrayU8))
]

{ #category : #accessing }
SkiaSurface >> similar: anExtent [
	| anIntegerExtent |
	
	anIntegerExtent := anExtent ceiling asIntegerPoint.
	^ SkiaImageInfo
		width: anIntegerExtent x
		height: anIntegerExtent y
		colorType: self colorType
		alphaType: self alphaType
		during: [ :aSkiaImageInfo | SkiaSurface fromNativeHandle: (self primNewSimilar: aSkiaImageInfo) ]
]

{ #category : #accessing }
SkiaSurface >> similar: anExtent during: aBlock [
	| anIntegerExtent |
	
	anIntegerExtent := anExtent ceiling asIntegerPoint.
	
	^ SkiaImageInfo
		width: anIntegerExtent x
		height: anIntegerExtent y
		colorType: self colorType
		alphaType: self alphaType
		during: [ :aSkiaImageInfo |
			SkiaSurface fromNativeHandle: (self primNewSimilar: aSkiaImageInfo) during: aBlock ]
]

{ #category : #accessing }
SkiaSurface >> snapshot [
	<return: #SkiaImage>

	^ SkiaImage fromNativeHandle: self primGetImageSnapshot
]

{ #category : #accessing }
SkiaSurface >> snapshotDuring: aBlock [
	^ SkiaImage fromNativeHandle: self primGetImageSnapshot during: aBlock
]
