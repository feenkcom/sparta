Class {
	#name : 'SkiaCompositionShadowLayer',
	#superclass : 'SkiaCompositionLayer',
	#category : 'Sparta-Skia-External'
}

{ #category : 'instance creation' }
SkiaCompositionShadowLayer class >> color: aColor radius: aRadiusPoint offset: anOffsetPoint [
	| aRed aGreen aBlue anAlpha |
	aRed := (aColor red * 255) asInteger.
	aGreen := (aColor green * 255) asInteger.
	aBlue := (aColor blue * 255) asInteger.
	anAlpha := (aColor alpha * 255) asInteger.
	self
		assert: [ aRed isInteger and: [ aRed between: 0 and: 255 ] ]
		description: [ 'Red must uint8 integer' ].
	self
		assert: [ aGreen isInteger and: [ aGreen between: 0 and: 255 ] ]
		description: [ 'Green must uint8 integer' ].
	self
		assert: [ aBlue isInteger and: [ aBlue between: 0 and: 255 ] ]
		description: [ 'Blue must uint8 integer' ].
	self
		assert: [ anAlpha isInteger and: [ anAlpha between: 0 and: 255 ] ]
		description: [ 'Alpha must uint8 integer' ].
	^ self
		fromNativeHandle:
			(self
				primCreateDeltaX: anOffsetPoint x
				deltaY: anOffsetPoint y
				sigmaX: aRadiusPoint x
				sigmaY: aRadiusPoint y
				r: aRed
				g: aGreen
				b: aBlue
				a: anAlpha)
]

{ #category : 'private - ffi' }
SkiaCompositionShadowLayer class >> primCreateDeltaX: aDeltaX deltaY: aDeltaY sigmaX: aSigmaX sigmaY: aSigmaY r: aRed g: aGreen b: aBlue a: anAlpha [
	^ self ffiCall: #(void* skia_shadow_layer_new(
		float32 aDeltaX,
		float32 aDeltaY,
		float32 aSigmaX,
		float32 aSigmaY,
		uint8 aRed,
		uint8 aGreen,
		uint8 aBlue,
		uint8 anAlpha))
]

{ #category : 'private - ffi' }
SkiaCompositionShadowLayer >> primSetCircleX: aX Y: aY radius: aRadius [
	^ self ffiCall: #(void skia_shadow_layer_set_circle(self,
		scalar aX, scalar aY, scalar aRadius))
]

{ #category : 'private - ffi' }
SkiaCompositionShadowLayer >> primSetPath: aSkiaPath [
	self ffiCall: #(void skia_shadow_layer_set_path(self, SkiaPath aSkiaPath))
]

{ #category : 'private - ffi' }
SkiaCompositionShadowLayer >> primSetRectangleLeft: aLeft top: aTop right: aRight bottom: aBottom [
	^ self ffiCall: #(void skia_shadow_layer_set_rectangle(self,
		scalar aLeft, scalar aTop, scalar aRight, scalar aBottom))
]

{ #category : 'private - ffi' }
SkiaCompositionShadowLayer >> primSetRoundedRectangleLeft: aLeft top: aTop right: aRight bottom: aBottom radiusTopLeft: aTopLeftRadius topRight: aTopRightRadius bottomRight: aBottomRightRadius bottomLeft: aBottomLeftRadius [
	^ self ffiCall: #(void skia_shadow_layer_set_rounded_rectangle(self,
		scalar aLeft, scalar aTop, scalar aRight, scalar aBottom,
		scalar aTopLeftRadius, scalar aTopRightRadius, scalar aBottomRightRadius, scalar aBottomLeftRadius))
]

{ #category : 'private - path' }
SkiaCompositionShadowLayer >> pushCircle: aSpartaCircle [
	self
		primSetCircleX: aSpartaCircle center x
		Y: aSpartaCircle center y
		radius: aSpartaCircle radius
]

{ #category : 'private - path' }
SkiaCompositionShadowLayer >> pushPath: aSpartaPath [
	self primSetPath: aSpartaPath
]

{ #category : 'private - path' }
SkiaCompositionShadowLayer >> pushRectangle: aSpartaRectangle [
	self
		primSetRectangleLeft: aSpartaRectangle left
		top: aSpartaRectangle top
		right: aSpartaRectangle right
		bottom: aSpartaRectangle bottom
]

{ #category : 'private - path' }
SkiaCompositionShadowLayer >> pushRoundedRectangle: aSpartaRoundedRectangle [
	self
		primSetRoundedRectangleLeft: aSpartaRoundedRectangle left
		top: aSpartaRoundedRectangle top
		right: aSpartaRoundedRectangle right
		bottom: aSpartaRoundedRectangle bottom
		radiusTopLeft: aSpartaRoundedRectangle topLeftRadius
		topRight: aSpartaRoundedRectangle topRightRadius
		bottomRight: aSpartaRoundedRectangle bottomRightRadius
		bottomLeft: aSpartaRoundedRectangle bottomLeftRadius
]
