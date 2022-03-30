Class {
	#name : #SkiaCompositionShadowLayer,
	#superclass : #SkiaCompositionLayer,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'private - ffi' }
SkiaCompositionShadowLayer class >> primNewShadow: aSkiaCompositorShadow [
	^ self ffiCall: #(void* compositor_shadow_layer_new(SkiaCompositorShadow aSkiaCompositorShadow))
]

{ #category : #'instance creation' }
SkiaCompositionShadowLayer class >> shadow: aSkiaCompositorShadow [
	^ self fromNativeHandle: (self primNewShadow: aSkiaCompositorShadow)
]
