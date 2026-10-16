Class {
	#name : #SkiaCompositionFilterBelowLayer,
	#superclass : #SkiaCompositionLayer,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'instance creation' }
SkiaCompositionFilterBelowLayer class >> filter: aSkiaCompositorFilter geometry: aSkiaCompositorGeometry offset: anOffset [
	^ self fromNativeHandle: (self
		primNewFilter: aSkiaCompositorFilter
		geometry: aSkiaCompositorGeometry
		offsetX: anOffset x
		offsetY: anOffset y)
]

{ #category : #'private - ffi' }
SkiaCompositionFilterBelowLayer class >> primNewFilter: aSkiaCompositorFilter geometry: aSkiaCompositorGeometry offsetX: anOffsetX offsetY: anOffsetY [
	^ self ffiCall: #(void* compositor_filter_below_layer_new(
		SkiaCompositorFilter aSkiaCompositorFilter,
		SkiaCompositorGeometry aSkiaCompositorGeometry,
		float32 anOffsetX,
		float32 anOffsetY))
]
