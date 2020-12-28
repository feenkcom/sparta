Class {
	#name : #SkiaCompositor,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaCompositor class >> primCreate [
	^ self ffiCall: #(void* skia_compositor_new())
]

{ #category : #'private - ffi' }
SkiaCompositor class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_compositor_drop(void** aHandle))
]

{ #category : #drawing }
SkiaCompositor >> draw: aSkiaCompositionLayer on: aSkiaCanvas [
	self primDraw: aSkiaCompositionLayer on: aSkiaCanvas surfaceCanvas
]

{ #category : #'private - ffi' }
SkiaCompositor >> primDraw: aSkiaCompositionLayer on: aSkiaSurfaceCanvas [
	self ffiCall: #(void skia_compositor_draw(self, SkiaCompositionLayer aSkiaCompositionLayer, SkiaSurfaceCanvas aSkiaSurfaceCanvas))
]
