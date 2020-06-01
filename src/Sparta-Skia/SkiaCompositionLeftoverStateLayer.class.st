Class {
	#name : #SkiaCompositionLeftoverStateLayer,
	#superclass : #SkiaCompositionLayer,
	#instVars : [
		'offset'
	],
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaCompositionLeftoverStateLayer class >> primCreate [
	^ self ffiCall: #(void* skia_leftover_state_layer_new())
]

{ #category : #'api - layer' }
SkiaCompositionLeftoverStateLayer >> clipPath: aSkiaPath offset: anOffset [
	self
		primClipPath: aSkiaPath
		offsetX: anOffset x
		offsetY: anOffset y
]

{ #category : #'api - layer' }
SkiaCompositionLeftoverStateLayer >> clipRectangle: aSpartaRectangle offset: anOffset [
	self
		primClipRectangleLeft: aSpartaRectangle left top: aSpartaRectangle top right: aSpartaRectangle right bottom: aSpartaRectangle bottom
		offsetX: anOffset x
		offsetY: anOffset y
]

{ #category : #'api - layer' }
SkiaCompositionLeftoverStateLayer >> clipRoundedRectangle: aSpartaRoundedRectangle offset: anOffset [
	self
		primClipRoundedRectangleLeft: aSpartaRoundedRectangle left
		top: aSpartaRoundedRectangle top
		right: aSpartaRoundedRectangle right
		bottom: aSpartaRoundedRectangle bottom
		radiusTopLeft: aSpartaRoundedRectangle topLeftRadius
		topRight: aSpartaRoundedRectangle topRightRadius
		bottomRight: aSpartaRoundedRectangle bottomRightRadius
		bottomLeft: aSpartaRoundedRectangle bottomLeftRadius
		offsetX: anOffset x
		offsetY: anOffset y
]

{ #category : #accessing }
SkiaCompositionLeftoverStateLayer >> offset [
	^ offset
]

{ #category : #accessing }
SkiaCompositionLeftoverStateLayer >> offset: anObject [
	offset := anObject
]

{ #category : #'private - ffi' }
SkiaCompositionLeftoverStateLayer >> primClipPath: aSkiaPath offsetX: anOffsetX offsetY: anOffsetY [
	self ffiCall: #(void skia_leftover_state_layer_clip_path(self,
		SkiaPath aSkiaPath,
		scalar anOffsetX,
		scalar anOffsetY))
]

{ #category : #'private - ffi' }
SkiaCompositionLeftoverStateLayer >> primClipRectangleLeft: aLeft top: aTop right: aRight bottom: aBottom offsetX: anOffsetX offsetY: anOffsetY [
	self ffiCall: #(void skia_leftover_state_layer_clip_rect(self,
		scalar aLeft, scalar aTop, scalar aRight, scalar aBottom,
		scalar anOffsetX, scalar anOffsetY))
]

{ #category : #'private - ffi' }
SkiaCompositionLeftoverStateLayer >> primClipRoundedRectangleLeft: aLeft top: aTop right: aRight bottom: aBottom radiusTopLeft: aTopLeftRadius topRight: aTopRightRadius bottomRight: aBottomRightRadius bottomLeft: aBottomLeftRadius offsetX: anOffsetX offsetY: anOffsetY [
	self ffiCall: #(void skia_leftover_state_layer_clip_rrect(self,
		scalar aLeft, scalar aTop, scalar aRight, scalar aBottom,
		scalar aTopLeftRadius, scalar aTopRightRadius, scalar aBottomRightRadius, scalar aBottomLeftRadius,
		scalar anOffsetX, scalar anOffsetY))
]

{ #category : #'private - ffi' }
SkiaCompositionLeftoverStateLayer >> primTransformScaleX: scaleX skewX: skewX transX: transX skewY: skewY scaleY: scaleY transY: transY perspX: perspX perspY: perspY persp: persp offsetX: offsetX offsetY: offsetY [
	self ffiCall: #(void skia_leftover_state_layer_transform (self,
		scalar scaleX, scalar skewX, scalar transX,
		scalar skewY, scalar scaleY, scalar transY,
		scalar perspX, scalar perspY, scalar persp,
		scalar offsetX, scalar offsetY))
]

{ #category : #'private - clipping' }
SkiaCompositionLeftoverStateLayer >> pushPath: aSkiaPath [
	self clipPath: aSkiaPath offset: offset
]

{ #category : #'private - clipping' }
SkiaCompositionLeftoverStateLayer >> pushRectangle: aRectangle [
	self clipRectangle: aRectangle offset: offset
]

{ #category : #'private - clipping' }
SkiaCompositionLeftoverStateLayer >> pushRoundedRectangle: aRoundedRectangle [
	self clipRoundedRectangle: aRoundedRectangle offset: offset
]

{ #category : #'api - layer' }
SkiaCompositionLeftoverStateLayer >> transform: aSpartaMatrix offset: anOffset [
	self primTransformScaleX: aSpartaMatrix sx skewX: aSpartaMatrix shx transX: aSpartaMatrix x
		skewY: aSpartaMatrix shy scaleY: aSpartaMatrix sy transY: aSpartaMatrix y
		perspX: 0 perspY: 0 persp: 1
		offsetX: anOffset x offsetY: anOffset y
]
