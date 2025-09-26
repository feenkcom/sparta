Class {
	#name : #SkiaCompositionTextureLayer,
	#superclass : #SkiaCompositionLayer,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'instance creation' }
SkiaCompositionTextureLayer class >> extent: aPoint rendering: aCallback payload: aPayload [
	^ self fromNativeHandle: (self
		primBorrowedWidth: aPoint x
		height: aPoint y
		rendering: aCallback
		payload: aPayload)
]

{ #category : #'private - ffi' }
SkiaCompositionTextureLayer class >> primBorrowedWidth: aWidth height: aHeight rendering: aCallback payload: aPayload [
	^ self ffiCall: #(void* compositor_texture_layer_new_borrowed(
		uint32 aWidth,
		uint32 aHeight,
		void* aCallback,
		void* aPayload))
]
