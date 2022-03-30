Class {
	#name : #SkiaCompositorShadow,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'instance creation' }
SkiaCompositorShadow class >> color: aColor radius: aRadiusPoint offset: anOffsetPoint geometry: aSkiaCompositorGeometry [
	^ self fromNativeHandle: (self primColor: aColor radius: aRadiusPoint offset: anOffsetPoint geometry: aSkiaCompositorGeometry)
]

{ #category : #'instance creation' }
SkiaCompositorShadow class >> color: aColor radius: aRadiusPoint offset: anOffsetPoint geometry: aSkiaCompositorGeometry during: aBlock [
	^ self
		fromNativeHandle: (self primColor: aColor radius: aRadiusPoint offset: anOffsetPoint geometry: aSkiaCompositorGeometry)
		during: aBlock
]

{ #category : #'private - ffi' }
SkiaCompositorShadow class >> primColor: aColor radius: aRadiusPoint offset: anOffsetPoint geometry: aSkiaCompositorGeometry [
	^ self
		primNewColor: (aColor pixelValueForDepth: 32)
		radiusX: aRadiusPoint x
		radiusY: aRadiusPoint y
		offsetX: anOffsetPoint x
		offsetY: anOffsetPoint y
		geometry: aSkiaCompositorGeometry
]

{ #category : #'private - ffi' }
SkiaCompositorShadow class >> primNewColor: anArgb radiusX: aRadiusX radiusY: aRadiusY offsetX: anOffsetX offsetY: anOffsetY geometry: aSkiaCompositorGeometry [
	^ self ffiCall: #(void* compositor_shadow_new(uint32 anArgb, float32 aRadiusX, float32 aRadiusY, float32 anOffsetX, float32 anOffsetY, SkiaCompositorGeometry aSkiaCompositorGeometry))
]

{ #category : #'private - ffi' }
SkiaCompositorShadow class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void compositor_shadow_drop(void** aHandle))
]
