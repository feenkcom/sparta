Class {
	#name : #SkiaCompositorCache,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'private - ffi' }
SkiaCompositorCache class >> primCreate [
	^ self ffiCall: #(void* skia_compositor_cache_new())
]

{ #category : #'private - ffi' }
SkiaCompositorCache class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_compositor_cache_drop(void** aHandle))
]
