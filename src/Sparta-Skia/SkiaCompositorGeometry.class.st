Class {
	#name : #SkiaCompositorGeometry,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #'instance creation' }
SkiaCompositorGeometry class >> circle: aSpartaCircle [
	^ self fromNativeHandle: (self primCircle: aSpartaCircle)
]

{ #category : #'instance creation' }
SkiaCompositorGeometry class >> circle: aSpartaCircle during: aBlock [
	^ self fromNativeHandle: (self primCircle: aSpartaCircle) during: aBlock
]

{ #category : #'instance creation' }
SkiaCompositorGeometry class >> none [
	^ self new
]

{ #category : #'instance creation' }
SkiaCompositorGeometry class >> path: aSkiaPath [
	^ SkiaCompositorPath
		fromSkiaPath: aSkiaPath
		during: [ :aCompositorPath | self fromNativeHandle: (self primPath: aCompositorPath) ]
]

{ #category : #'instance creation' }
SkiaCompositorGeometry class >> path: aSkiaPath during: aBlock [
	^ SkiaCompositorPath
		fromSkiaPath: aSkiaPath
		during: [ :aCompositorPath | self fromNativeHandle: (self primPath: aCompositorPath) during: aBlock ]
]

{ #category : #'private - ffi' }
SkiaCompositorGeometry class >> primCircle: aSpartaCircle [
	^ self
		primCircleCenterX: aSpartaCircle center x
		centerY: aSpartaCircle center y
		radius: aSpartaCircle radius
]

{ #category : #'private - ffi' }
SkiaCompositorGeometry class >> primCircleCenterX: aCenterX centerY: aCenterY radius: aRadius [
	^ self ffiCall: #(void* compositor_geometry_new_circle(float32 aCenterX, float32 aCenterY, float32 aRadius))
]

{ #category : #'private - ffi' }
SkiaCompositorGeometry class >> primCreate [
	^ self ffiCall: #(void* compositor_geometry_none())
]

{ #category : #'private - ffi' }
SkiaCompositorGeometry class >> primPath: aSkiaCompositorPath [
	^ self ffiCall: #(void* compositor_geometry_new_path(SkiaCompositorPath aSkiaCompositorPath))
]

{ #category : #'private - ffi' }
SkiaCompositorGeometry class >> primRectangle: aRectangle [
	^ self
		primRectangleLeft: aRectangle left
		top: aRectangle top
		width: aRectangle width
		height: aRectangle height
]

{ #category : #'private - ffi' }
SkiaCompositorGeometry class >> primRectangleLeft: aLeft top: aTop width: aWidth height: aHeight [
	^ self ffiCall: #(void* compositor_geometry_new_rectangle(float32 aLeft, float32 aTop, float32 aWidth, float32 aHeight))
]

{ #category : #'private - ffi' }
SkiaCompositorGeometry class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void compositor_geometry_drop(void* aHandle))
]

{ #category : #'private - ffi' }
SkiaCompositorGeometry class >> primRoundedRectangle: aSpartaRoundedRectangle [
	^ self
		primRoundedRectangleLeft: aSpartaRoundedRectangle left
		top: aSpartaRoundedRectangle top
		width: aSpartaRoundedRectangle width
		height: aSpartaRoundedRectangle height
		radiusTopLeft: aSpartaRoundedRectangle topLeftRadius
		topRight: aSpartaRoundedRectangle topRightRadius
		bottomRight: aSpartaRoundedRectangle bottomRightRadius
		bottomLeft: aSpartaRoundedRectangle bottomLeftRadius
]

{ #category : #'private - ffi' }
SkiaCompositorGeometry class >> primRoundedRectangleLeft: aLeft top: aTop width: aWidth height: aHeight radiusTopLeft: aTopLeftRadius topRight: aTopRightRadius bottomRight: aBottomRightRadius bottomLeft: aBottomLeftRadius [
	self ffiCall: #(void* compositor_geometry_new_rounded_rectangle(
		float32 aLeft,
		float32 aTop,
		float32 aWidth,
		float32 aHeight,
		float32 aTopLeftRadius,
		float32 aTopLeftRadius,
		float32 aTopRightRadius,
		float32 aTopRightRadius,
		float32 aBottomRightRadius,
		float32 aBottomRightRadius,
		float32 aBottomLeftRadius,
		float32 aBottomLeftRadius))
]

{ #category : #'instance creation' }
SkiaCompositorGeometry class >> rectangle: aRectangle [
	^ self fromNativeHandle: (self primRectangle: aRectangle)
]

{ #category : #'instance creation' }
SkiaCompositorGeometry class >> rectangle: aRectangle during: aBlock [
	^ self fromNativeHandle: (self primRectangle: aRectangle) during: aBlock
]

{ #category : #'instance creation' }
SkiaCompositorGeometry class >> roundedRectangle: aSpartaRoundedRectangle [
	^ self fromNativeHandle: (self primRoundedRectangle: aSpartaRoundedRectangle)
]

{ #category : #'instance creation' }
SkiaCompositorGeometry class >> roundedRectangle: aSpartaRoundedRectangle during: aBlock [
	^ self fromNativeHandle: (self primRoundedRectangle: aSpartaRoundedRectangle) during: aBlock
]
