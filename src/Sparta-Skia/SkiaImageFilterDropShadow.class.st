Class {
	#name : #SkiaImageFilterDropShadow,
	#superclass : #SkiaImageFilter,
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaImageFilterDropShadow class >> delta: aDeltaPoint sigma: aSigmaPoint color: aColor [
	^ self
		delta: aDeltaPoint
		sigma: aSigmaPoint
		color: aColor
		input: SkiaImageFilter null
]

{ #category : #'instance creation' }
SkiaImageFilterDropShadow class >> delta: aDeltaPoint sigma: aSigmaPoint color: aColor during: aBlock [
	^ self
		delta: aDeltaPoint
		sigma: aSigmaPoint
		color: aColor
		input: SkiaImageFilter null
		during: aBlock
]

{ #category : #'instance creation' }
SkiaImageFilterDropShadow class >> delta: aDeltaPoint sigma: aSigmaPoint color: aColor input: anOptionalSkiaImageFilter [
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
		
	^ self fromNativeHandle: (self
		primCreateDeltaX: aDeltaPoint x
		deltaY: aDeltaPoint y
		sigmaX: aSigmaPoint x
		sigmaY: aSigmaPoint y
		r: aRed
		g: aGreen
		b: aBlue
		a: anAlpha
		input: anOptionalSkiaImageFilter)
]

{ #category : #'instance creation' }
SkiaImageFilterDropShadow class >> delta: aDeltaPoint sigma: aSigmaPoint color: aColor input: anOptionalSkiaImageFilter during: aBlock [
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
		
	^ self fromNativeHandle: (self
		primCreateDeltaX: aDeltaPoint x
		deltaY: aDeltaPoint y
		sigmaX: aSigmaPoint x
		sigmaY: aSigmaPoint y
		r: aRed
		g: aGreen
		b: aBlue
		a: anAlpha
		input: anOptionalSkiaImageFilter) during: aBlock
]

{ #category : #'private - ffi' }
SkiaImageFilterDropShadow class >> primCreateDeltaX: aDeltaX deltaY: aDeltaY sigmaX: aSigmaX sigmaY: aSigmaY r: aRed g: aGreen b: aBlue a: anAlpha input: anOptionalSkiaImageFilter [
	^ self ffiCall: #(void* skia_image_filter_drop_shadow(
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
