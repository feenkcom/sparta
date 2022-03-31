Class {
	#name : #SkiaCompositorLayers,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'private - ffi' }
SkiaCompositorLayers class >> primCreate [
	^ self ffiCall: #(void* compositor_layers_new())
]

{ #category : #'private - ffi' }
SkiaCompositorLayers class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void compositor_layers_drop(void** aHandle))
]

{ #category : #adding }
SkiaCompositorLayers >> add: aLayer [
	self primAdd: aLayer
]

{ #category : #'private - ffi' }
SkiaCompositorLayers >> primAdd: aLayer [
	self ffiCall: #(void compositor_layers_add(self, SkiaCompositionLayer aLayer))
]
