Class {
	#name : #SkiaCompositorShadowCache,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'private - ffi' }
SkiaCompositorShadowCache class >> primCreate [
	^ self ffiCall: #(void* skia_compositor_shadow_cache_new())
]

{ #category : #'private - ffi' }
SkiaCompositorShadowCache class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_compositor_shadow_cache_drop(void** aHandle))
]
