Class {
	#name : #SkiaCompositionGeometry,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'instance creation' }
SkiaCompositionGeometry class >> none [
	^ self new
]

{ #category : #'instance creation' }
SkiaCompositionGeometry class >> path: aSkiaPath [
	self shouldBeImplemented
]

{ #category : #'private - ffi' }
SkiaCompositionGeometry class >> primCreate [
	^ self ffiCall: #(void* compositor_geometry_none())
]

{ #category : #'private - ffi' }
SkiaCompositionGeometry class >> primPath: aSkiaCompositionPath [
	^ self ffiCall: #(void* compositor_geometry_new_path(SkiaCompositionPath aSkiaCompositionPath))
]

{ #category : #'private - ffi' }
SkiaCompositionGeometry class >> primRectangleLeft: aLeft top: aTop width: aWidth height: aHeight [
	^ self ffiCall: #(void* compositor_geometry_new_rectangle(float32 aLeft, float32 aTop, float32 aWidth, float32 aHeight))
]

{ #category : #'private - ffi' }
SkiaCompositionGeometry class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void compositor_geometry_drop(void* aHandle))
]

{ #category : #'instance creation' }
SkiaCompositionGeometry class >> rectangle: aRectangle [
	^ self fromNativeHandle: (self
		primRectangleLeft: aRectangle left
		top: aRectangle top
		width: aRectangle width
		height: aRectangle height)
]
