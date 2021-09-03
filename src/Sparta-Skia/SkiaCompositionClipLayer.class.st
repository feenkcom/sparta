Class {
	#name : 'SkiaCompositionClipLayer',
	#superclass : 'SkiaCompositionLayer',
	#category : 'Sparta-Skia-External'
}

{ #category : 'instance creation' }
SkiaCompositionClipLayer class >> path: aSkiaPath offset: anOffset [
	^ self fromNativeHandle: (self primClipPath: aSkiaPath offsetX: anOffset x offsetY: anOffset y)
]

{ #category : 'private - ffi' }
SkiaCompositionClipLayer class >> primClipPath: aSkiaPath offsetX: anOffsetX offsetY: anOffsetY [
	^ self ffiCall: #(void* skia_clip_layer_path(
		SkiaPath aSkiaPath,
		scalar anOffsetX,
		scalar anOffsetY))
]

{ #category : 'private - ffi' }
SkiaCompositionClipLayer class >> primClipRectangleLeft: aLeft top: aTop right: aRight bottom: aBottom offsetX: anOffsetX offsetY: anOffsetY [
	^ self ffiCall: #(void* skia_clip_layer_rect(
		scalar aLeft, scalar aTop, scalar aRight, scalar aBottom,
		scalar anOffsetX, scalar anOffsetY))
]

{ #category : 'private - ffi' }
SkiaCompositionClipLayer class >> primClipRoundedRectangleLeft: aLeft top: aTop right: aRight bottom: aBottom radiusTopLeft: aTopLeftRadius topRight: aTopRightRadius bottomRight: aBottomRightRadius bottomLeft: aBottomLeftRadius offsetX: anOffsetX offsetY: anOffsetY [
	^ self ffiCall: #(void* skia_clip_layer_rrect(
		scalar aLeft, scalar aTop, scalar aRight, scalar aBottom,
		scalar aTopLeftRadius, scalar aTopRightRadius, scalar aBottomRightRadius, scalar aBottomLeftRadius,
		scalar anOffsetX, scalar anOffsetY))
]

{ #category : 'private - ffi' }
SkiaCompositionClipLayer class >> primCreate [
	^ self ffiCall: #(void* skia_clip_layer_new())
]

{ #category : 'instance creation' }
SkiaCompositionClipLayer class >> rectangle: aSpartaRectangle offset: anOffset [
	^ self fromNativeHandle: (self
		primClipRectangleLeft: aSpartaRectangle left top: aSpartaRectangle top right: aSpartaRectangle right bottom: aSpartaRectangle bottom
		offsetX: anOffset x
		offsetY: anOffset y)
]

{ #category : 'instance creation' }
SkiaCompositionClipLayer class >> roundedRectangle: aSpartaRoundedRectangle offset: anOffset [
	^ self fromNativeHandle: (self
		primClipRoundedRectangleLeft: aSpartaRoundedRectangle left
		top: aSpartaRoundedRectangle top
		right: aSpartaRoundedRectangle right
		bottom: aSpartaRoundedRectangle bottom
		radiusTopLeft: aSpartaRoundedRectangle topLeftRadius
		topRight: aSpartaRoundedRectangle topRightRadius
		bottomRight: aSpartaRoundedRectangle bottomRightRadius
		bottomLeft: aSpartaRoundedRectangle bottomLeftRadius
		offsetX: anOffset x
		offsetY: anOffset y)
]
