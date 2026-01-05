Class {
	#name : #SkiaCompositionDynamicOffsetLayer,
	#superclass : #SkiaCompositionLayer,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'instance creation' }
SkiaCompositionDynamicOffsetLayer class >> offsetFn: offsetFn payload: payload cloneFn: cloneFn freeFn: freeFn [
	^ self
		fromNativeHandle: (self
				primNewOffsetFn: offsetFn
				payload: payload
				cloneFn: cloneFn
				freeFn: freeFn)
]

{ #category : #'instance creation' }
SkiaCompositionDynamicOffsetLayer class >> opacity: aNumber [
	^ self fromNativeHandle: (self primNewOpacity: aNumber)
]

{ #category : #'private - ffi' }
SkiaCompositionDynamicOffsetLayer class >> primNewOffsetFn: offsetFn payload: payload cloneFn: cloneFn freeFn: freeFn [
	^ self ffiCall: #(void* compositor_dynamic_offset_layer_new(
		void* offsetFn,
		void* payload,
		void* cloneFn,
		void* freeFn
	))
]
