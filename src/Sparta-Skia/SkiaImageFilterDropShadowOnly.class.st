Class {
	#name : 'SkiaImageFilterDropShadowOnly',
	#superclass : 'SkiaImageFilterDropShadow',
	#category : 'Sparta-Skia-External'
}

{ #category : 'private - ffi' }
SkiaImageFilterDropShadowOnly class >> primCreateDeltaX: aDeltaX deltaY: aDeltaY sigmaX: aSigmaX sigmaY: aSigmaY r: aRed g: aGreen b: aBlue a: anAlpha input: anOptionalSkiaImageFilter [
	^ self ffiCall: #(void* skia_image_filter_drop_shadow_only(
		float32 aDeltaX,
		float32 aDeltaY,
		float32 aSigmaX,
		float32 aSigmaY,
		uint8 aRed,
		uint8 aGreen,
		uint8 aBlue,
		uint8 anAlpha,
		SkiaImageFilter anOptionalSkiaImageFilter))
]
