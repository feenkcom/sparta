Class {
	#name : #SkiaCompositionOpacityLayer,
	#superclass : #SkiaCompositionLayer,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'instance creation' }
SkiaCompositionOpacityLayer class >> opacity: aNumber [
	^ self fromNativeHandle: (self primNewOpacity: aNumber)
]

{ #category : #'private - ffi' }
SkiaCompositionOpacityLayer class >> primNewOpacity: aNumber [
	^ self ffiCall: #(void* compositor_opacity_layer_new_alpha(float32 aNumber))
]
