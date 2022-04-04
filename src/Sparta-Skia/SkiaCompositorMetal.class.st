Class {
	#name : #SkiaCompositorMetal,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'instance creation' }
SkiaCompositorMetal class >> forNSView: nsView extent: anExtent [
	^ self fromNativeHandle: (self primCreate: nsView width: anExtent x height: anExtent y)
]

{ #category : #'private - ffi' }
SkiaCompositorMetal class >> primCreate: nsView width: aWidth height: aHeight [
	^ self
		ffiCall: #(void* skia_metal_compositor_new_size(void* nsView, uint32 aWidth, uint32 aHeight))
		options: #(optEventLoop)
]

{ #category : #'private - ffi' }
SkiaCompositorMetal class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self
		ffiCall: #(void skia_metal_compositor_drop(void** aHandle))
		options: #(optEventLoop)
]

{ #category : #'api - drawing' }
SkiaCompositorMetal >> draw [
	self primDraw
]

{ #category : #'private - ffi' }
SkiaCompositorMetal >> primDraw [
	self
		ffiCall: #(void skia_metal_compositor_draw(self))
		options: #(optEventLoop optNonBlocking)
]

{ #category : #'private - ffi' }
SkiaCompositorMetal >> primResizeWidth: aWidth height: aHeight [
	self ffiCall: #(void skia_metal_compositor_resize(
		self,
		uint32 aWidth,
		uint32 aHeight))
]

{ #category : #'private - ffi' }
SkiaCompositorMetal >> primSubmitLayer: aSkiaCompositionLayer [
	self ffiCall: #(void skia_metal_compositor_submit_layer(
		self,
		SkiaCompositionLayer aSkiaCompositionLayer))
]

{ #category : #'api - drawing' }
SkiaCompositorMetal >> resize: anExtent [
	self
		primResizeWidth: anExtent x
		height: anExtent y
]

{ #category : #'api - drawing' }
SkiaCompositorMetal >> submitLayer: aSkiaCompositionLayer [
	self primSubmitLayer: aSkiaCompositionLayer
]
