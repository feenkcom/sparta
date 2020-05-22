Class {
	#name : #SkiaCompositionOffsetLayer,
	#superclass : #SkiaCompositionLayer,
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaCompositionOffsetLayer class >> offset: aPoint [
	^ self fromNativeHandle: (self primNewX: aPoint x Y: aPoint y)
]

{ #category : #'private - ffi' }
SkiaCompositionOffsetLayer class >> primCreate [
	^ self ffiCall: #(void* skia_offset_layer_new())
]

{ #category : #'private - ffi' }
SkiaCompositionOffsetLayer class >> primNewX: aX Y: aY [
	^ self ffiCall: #(void* skia_offset_layer_new_point(scalar aX, scalar aY))
]
