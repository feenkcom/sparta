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

{ #category : #accessing }
SkiaCompositionOffsetLayer >> offset [
	<return: #Point>
	
	^ self x @ self y
]

{ #category : #accessing }
SkiaCompositionOffsetLayer >> offset: aPoint [
	self primSetX: aPoint x Y: aPoint y
]

{ #category : #'private - ffi' }
SkiaCompositionOffsetLayer >> primGetX [
	^ self ffiCall: #(scalar skia_offset_layer_get_x(self))
]

{ #category : #'private - ffi' }
SkiaCompositionOffsetLayer >> primGetY [
	^ self ffiCall: #(scalar skia_offset_layer_get_y(self))
]

{ #category : #'private - ffi' }
SkiaCompositionOffsetLayer >> primSetX: aX Y: aY [
	^ self ffiCall: #(void skia_offset_layer_set_offset(self, scalar aX, scalar aY))
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
