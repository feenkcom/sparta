Class {
	#name : #SkiaPaint,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
SkiaPaint class >> primCreate [
	^ self ffiCall: #(void* skia_paint_default())
]

{ #category : #'private - ffi' }
SkiaPaint class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_paint_drop(void* aHandle))
]

{ #category : #accessing }
SkiaPaint >> antiAlias [
	<return: #Boolean>
	
	^ self primIsAntiAlias
]

{ #category : #accessing }
SkiaPaint >> antiAlias: aBoolean [	
	self primSetAntiAlias: aBoolean
]

{ #category : #accessing }
SkiaPaint >> color: aColor [
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
		
	self primSetR: aRed g: aGreen b: aBlue a: anAlpha
]

{ #category : #accessing }
SkiaPaint >> dither [
	<return: #Boolean>

	^ self primIsDither
]

{ #category : #accessing }
SkiaPaint >> dither: aBoolean [
	self primSetDither: aBoolean
]

{ #category : #'gt-extension' }
SkiaPaint >> gtInforFor: aView [
	<gtView>

	^ ({ 
		#antiAlias -> self antiAlias.
		#dither -> self dither.
		#paintStyle -> self paintStyle.
		#strokeWidth -> self strokeWidth.
	 } asOrderedDictionary gtItemsFor: aView)
			title: 'Info';
			priority: 2
]

{ #category : #accessing }
SkiaPaint >> paintStyle [
	<return: #SkiaPaintStyle>
	
	^ self primGetPaintStyle
]

{ #category : #accessing }
SkiaPaint >> paintStyle: aSkiaPaintStyle [	
	self primSetPaintStyle: aSkiaPaintStyle
]

{ #category : #'private - ffi' }
SkiaPaint >> primGetPaintStyle [
	self ffiCall: #(SkiaPaintStyle skia_paint_style(self))
]

{ #category : #'private - ffi' }
SkiaPaint >> primGetStrokeWidth [
	self ffiCall: #(float32 skia_paint_stroke_width(self))
]

{ #category : #'private - ffi' }
SkiaPaint >> primIsAntiAlias [
	self ffiCall: #(bool skia_paint_is_anti_alias(self))
]

{ #category : #'private - ffi' }
SkiaPaint >> primIsDither [
	self ffiCall: #(bool skia_paint_is_dither(self))
]

{ #category : #'private - ffi' }
SkiaPaint >> primReset [
	self ffiCall: #(void skia_paint_reset(self))
]

{ #category : #'private - ffi' }
SkiaPaint >> primSetAntiAlias: isAntiAlias [
	self ffiCall: #(void skia_paint_set_anti_alias(self, bool isAntiAlias))
]

{ #category : #'private - ffi' }
SkiaPaint >> primSetDither: isDither [
	self ffiCall: #(void skia_paint_set_dither(self, bool isDither))
]

{ #category : #'private - ffi' }
SkiaPaint >> primSetPaintStyle: aPaintStyle [
	self ffiCall: #(void skia_paint_style(self, SkiaPaintStyle aPaintStyle))
]

{ #category : #'private - ffi' }
SkiaPaint >> primSetR: r g: g b: b a: a [
	self ffiCall: #(void skia_paint_set_rgba(self, uint8 r, uint8 g, uint8 b, uint8 a))
]

{ #category : #'private - ffi' }
SkiaPaint >> primSetStrokeWidth: aWidth [
	self ffiCall: #(void skia_paint_stroke_width(self, float32 aWidth))
]

{ #category : #accessing }
SkiaPaint >> reset [
	self primReset
]

{ #category : #accessing }
SkiaPaint >> strokeWidth [
	<return: #Float>
	
	^ self primGetStrokeWidth
]

{ #category : #accessing }
SkiaPaint >> strokeWidth: aNumber [	
	self primSetStrokeWidth: aNumber
]
