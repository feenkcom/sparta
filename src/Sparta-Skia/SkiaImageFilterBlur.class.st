Class {
	#name : 'SkiaImageFilterBlur',
	#superclass : 'SkiaImageFilter',
	#category : 'Sparta-Skia-External'
}

{ #category : 'private - ffi' }
SkiaImageFilterBlur class >> primCreateSigmaX: aSigmaX sigmaY: aSigmaY tileMode: aSkiaTileMode input: anOptionalSkiaImageFilter [
	^ self ffiCall: #(void* skia_image_filter_blur(
		float32 aSigmaX,
		float32 aSigmaY,
		SkiaTileMode aSkiaTileMode,
		SkiaImageFilter anOptionalSkiaImageFilter))
]

{ #category : 'instance creation' }
SkiaImageFilterBlur class >> sigma: aPoint [
	^ self sigma: aPoint tileMode: SkiaTileMode Clamp
]

{ #category : 'instance creation' }
SkiaImageFilterBlur class >> sigma: aPoint during: aBlock [
	^ self sigma: aPoint tileMode: SkiaTileMode Clamp during: aBlock
]

{ #category : 'instance creation' }
SkiaImageFilterBlur class >> sigma: aPoint tileMode: aSkiaTileMode [
	^ self sigma: aPoint tileMode: aSkiaTileMode input: SkiaImageFilter null
]

{ #category : 'instance creation' }
SkiaImageFilterBlur class >> sigma: aPoint tileMode: aSkiaTileMode during: aBlock [
	^ self sigma: aPoint tileMode: aSkiaTileMode input: SkiaImageFilter null during: aBlock
]

{ #category : 'instance creation' }
SkiaImageFilterBlur class >> sigma: aPoint tileMode: aSkiaTileMode input: anOptionalSkiaImageFilter [
	^ self fromNativeHandle: (self primCreateSigmaX: aPoint x sigmaY: aPoint y tileMode: aSkiaTileMode input: anOptionalSkiaImageFilter)
]

{ #category : 'instance creation' }
SkiaImageFilterBlur class >> sigma: aPoint tileMode: aSkiaTileMode input: anOptionalSkiaImageFilter during: aBlock [
	^ self fromNativeHandle: (self primCreateSigmaX: aPoint x sigmaY: aPoint y tileMode: aSkiaTileMode input: anOptionalSkiaImageFilter) during: aBlock
]
