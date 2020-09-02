Class {
	#name : #SkiaCompositor,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaCompositor class >> accelerated: aGlutinEventLoop windowedContext: aGlutinWindowedContext workers: anAmountOfWorkers [
	^ self fromNativeHandle: (self primCreateAccelerated: anAmountOfWorkers eventLoop: aGlutinEventLoop windowedContext: aGlutinWindowedContext)
]

{ #category : #'private - ffi' }
SkiaCompositor class >> primCreate [
	^ self ffiCall: #(void* skia_compositor_new())
]

{ #category : #'private - ffi' }
SkiaCompositor class >> primCreateAccelerated: anAmountOfWorkers eventLoop: aGlutinEventLoop windowedContext: aGlutinWindowedContext [
	^ self ffiCall: #(void* skia_compositor_new_accelerated(
		size_t anAmountOfWorkers,
		GlutinEventLoop aGlutinEventLoop,
		GlutinWindowedContext aGlutinWindowedContext
	))
]

{ #category : #'private - ffi' }
SkiaCompositor class >> primCreateSoftware: anAmountOfWorkers [
	^ self ffiCall: #(void* skia_compositor_new_software(size_t anAmountOfWorkers))
]

{ #category : #'private - ffi' }
SkiaCompositor class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_compositor_drop(void** aHandle))
]

{ #category : #'instance creation' }
SkiaCompositor class >> workers: anAmountOfWorkers [
	^ self fromNativeHandle: (self primCreateSoftware: anAmountOfWorkers)
]

{ #category : #drawing }
SkiaCompositor >> draw: aSkiaCompositionLayer on: aSkiaCanvas [
	self primDraw: aSkiaCompositionLayer on: aSkiaCanvas surfaceCanvas
]

{ #category : #'private - ffi' }
SkiaCompositor >> primDraw: aSkiaCompositionLayer on: aSkiaSurfaceCanvas [
	self ffiCall: #(void skia_compositor_draw(self, SkiaCompositionLayer aSkiaCompositionLayer, SkiaSurfaceCanvas aSkiaSurfaceCanvas))
]
