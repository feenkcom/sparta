Class {
	#name : #SkiaSurface,
	#superclass : #SkiaExternalObject,
	#traits : 'TSpartaSurface',
	#classTraits : 'TSpartaSurface classTrait',
	#instVars : [
		'registeredCanvases',
		'gpuContext'
	],
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaSurface class >> fromRenderTarget: aSkiaBackendRenderTarget colorType: aSkiaColorType [
	| aSkiaContext |

	aSkiaContext := SkiaContext new.
	
	NonInteractiveTranscript stdout show: 'colorType '; show: aSkiaColorType; cr.
	NonInteractiveTranscript stdout show: 'maxTextureSize: '; show: aSkiaContext maxTextureSize; cr.
	NonInteractiveTranscript stdout show: 'maxRenderTargetSize: '; show: aSkiaContext maxRenderTargetSize; cr.
	NonInteractiveTranscript stdout show: 'maxSurfaceSampleCount: '; show: (aSkiaContext maxSurfaceSampleCountForColorType: aSkiaColorType); cr.
	NonInteractiveTranscript stdout show: 'isColorTypeSupportedAsImage: '; show: (aSkiaContext isColorTypeSupportedAsImage: aSkiaColorType); cr.
	NonInteractiveTranscript stdout show: 'isColorTypeSupportedAsSurface: '; show: (aSkiaContext isColorTypeSupportedAsSurface: aSkiaColorType); cr.
	
	^ (self fromNativeHandle: (self primFromRenderTarget: aSkiaBackendRenderTarget context: aSkiaContext colorType: aSkiaColorType))
		gpuContext: aSkiaContext
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
SkiaSurface class >> newRenderTargetImageInfo: aSkiaImageInfo [
	| aSkiaContext |

	aSkiaContext := SkiaContext new.
	
	NonInteractiveTranscript stdout show: 'colorType '; show: aSkiaImageInfo colorType; cr.
	NonInteractiveTranscript stdout show: 'maxTextureSize: '; show: aSkiaContext maxTextureSize; cr.
	NonInteractiveTranscript stdout show: 'maxRenderTargetSize: '; show: aSkiaContext maxRenderTargetSize; cr.
	NonInteractiveTranscript stdout show: 'maxSurfaceSampleCount: '; show: (aSkiaContext maxSurfaceSampleCountForColorType: aSkiaImageInfo colorType); cr.
	NonInteractiveTranscript stdout show: 'isColorTypeSupportedAsImage: '; show: (aSkiaContext isColorTypeSupportedAsImage: aSkiaImageInfo colorType); cr.
	NonInteractiveTranscript stdout show: 'isColorTypeSupportedAsSurface: '; show: (aSkiaContext isColorTypeSupportedAsSurface: aSkiaImageInfo colorType); cr.

	^ (self fromNativeHandle: (self primNewRenderTargetContext: aSkiaContext imageInfo: aSkiaImageInfo))
		gpuContext: aSkiaContext
]

{ #category : #'private - ffi' }
SkiaSurface class >> primCreate [
	^ self ffiCall: #(void* skia_surface_new_default())
]

{ #category : #'private - ffi' }
SkiaSurface class >> primFromRenderTarget: aSkiaBackendRenderTarget context: aSkiaContext colorType: aSkiaColorType [
	^ self ffiCall: #(void* skia_surface_from_render_target(
		SkiaBackendRenderTarget aSkiaBackendRenderTarget,
		SkiaContext aSkiaContext,
		SkiaColorType aSkiaColorType))
]

{ #category : #'private - ffi' }
SkiaSurface class >> primNewRaster32PremultipliedWidth: aWidth height: aHeight [
	^ self ffiCall: #(void* skia_surface_new_raster_n32_premul(int32 aWidth, int32 aHeight))
]

{ #category : #'private - ffi' }
SkiaSurface class >> primNewRasterDirectImageInfo: aSkiaImageInfo pixels: thePixels stride: aStride [
	^ self ffiCall: #(void* skia_surface_new_raster_direct(SkiaImageInfo aSkiaImageInfo, GtBoxerArrayU8 thePixels, size_t aStride))
]

{ #category : #'private - ffi' }
SkiaSurface class >> primNewRenderTargetContext: aSkiaContext imageInfo: aSkiaImageInfo [
	^ self ffiCall: #(void* skia_surface_new_render_target(SkiaImageInfo aSkiaImageInfo, SkiaContext aSkiaContext))
]

{ #category : #'private - ffi' }
SkiaSurface class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_surface_drop(void* aHandle))
]

{ #category : #finalization }
SkiaSurface class >> release: aSkiaSurface [
	aSkiaSurface registeredCanvasesDo: [ :eachCanvas | eachCanvas release ].
	super release: aSkiaSurface getHandle
]

{ #category : #converting }
SkiaSurface >> asForm [
	<return: #Form>
	
	^ Form extent: self extent depth: 32 bits: self data asBitmap
]

{ #category : #accessing }
SkiaSurface >> canvas [
	<return: #SkiaSurfaceCanvas>
	| aCanvas |

	aCanvas := SkiaSurfaceCanvas fromNativeHandle: self primGetCanvas.
	registeredCanvases add: aCanvas.
	^ aCanvas
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
SkiaSurface >> gtInforFor: aView [
	<gtView>

	^ (self imageInfo gtInforFor: aView)
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

{ #category : #initialization }
SkiaSurface >> initialize [
	super initialize.

	registeredCanvases := WeakIdentitySet new
]

{ #category : #'private - ffi' }
SkiaSurface >> primFlush [
	self ffiCall: #(void skia_surface_flush(self))
]

{ #category : #'private - ffi' }
SkiaSurface >> primGetCanvas [
	^ self ffiCall: #(void* skia_surface_get_canvas(self))
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
SkiaSurface >> primReadAllPixels: aBoxerArrayU8 [
	^ self ffiCall: #(bool skia_surface_read_all_pixels(self, GtBoxerArrayU8 aBoxerArrayU8))
]

{ #category : #'external resource management' }
SkiaSurface >> registeredCanvasesDo: aBlock [
	registeredCanvases do: aBlock
]

{ #category : #'external resource management' }
SkiaSurface >> resourceData [
	^ self
]

{ #category : #accessing }
SkiaSurface >> snapshot [
	<return: #SkiaImage>

	^ SkiaImage fromNativeHandle: self primGetImageSnapshot
]
