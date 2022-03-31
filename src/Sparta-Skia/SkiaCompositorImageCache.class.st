Class {
	#name : #SkiaCompositorImageCache,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'private - ffi' }
SkiaCompositorImageCache class >> primCreate [
	^ self ffiCall: #(void* skia_compositor_image_cache_new())
]

{ #category : #'private - ffi' }
SkiaCompositorImageCache class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_compositor_image_cache_drop(void** aHandle))
]
