Class {
	#name : #SkiaCompositionOffsetLayer,
	#superclass : #SkiaCompositionLayer,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'instance creation' }
SkiaCompositionOffsetLayer class >> offset: aPoint [
	^ self fromNativeHandle: (self primNewX: aPoint x Y: aPoint y)
]

{ #category : #'private - ffi' }
SkiaCompositionOffsetLayer class >> primCreate [
	^ self ffiCall: #(void* compositor_offset_layer_new())
]

{ #category : #'private - ffi' }
SkiaCompositionOffsetLayer class >> primNewX: aX Y: aY [
	^ self ffiCall: #(void* compositor_offset_layer_new_point(float32 aX, float32 aY))
]

{ #category : #accessing }
SkiaCompositionOffsetLayer >> offset [
	<return: #Point>
	
	^ self x @ self y
]

{ #category : #'private - ffi' }
SkiaCompositionOffsetLayer >> primGetX [
	^ self ffiCall: #(float32 compositor_offset_layer_get_x(self))
]

{ #category : #'private - ffi' }
SkiaCompositionOffsetLayer >> primGetY [
	^ self ffiCall: #(float32 compositor_offset_layer_get_y(self))
]

{ #category : #'private - ffi' }
SkiaCompositionOffsetLayer >> primWithX: aX Y: aY [
	^ self ffiCall: #(void* compositor_offset_layer_with_point(self, float32 aX, float32 aY))
]

{ #category : #accessing }
SkiaCompositionOffsetLayer >> withOffset: aPoint [
	(aPoint closeTo: self offset)
		ifTrue: [ ^ self ].

	^ self class fromNativeHandle: (self primWithX: aPoint x Y: aPoint y)
]

{ #category : #accessing }
SkiaCompositionOffsetLayer >> x [
	<return: #Number>
	
	^ self primGetX
]

{ #category : #accessing }
SkiaCompositionOffsetLayer >> y [
	<return: #Number>
	
	^ self primGetY
]
