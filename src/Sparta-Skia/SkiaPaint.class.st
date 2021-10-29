Class {
	#name : #SkiaPaint,
	#superclass : #SkiaExternalObject,
	#category : 'Sparta-Skia-External'
}

{ #category : #accessing }
SkiaPaint class >> defaultFilterQuality [
	^ SkiaFilterQuality None
]

{ #category : #'private - ffi' }
SkiaPaint class >> primCreate [
	^ self ffiCall: #(void* skia_paint_default())
]

{ #category : #'private - ffi' }
SkiaPaint class >> primRelease: aHandle [
	
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void skia_paint_drop(void** aHandle))
]

{ #category : #accessing }
SkiaPaint >> alpha [
	"A float between 0 and 1"
	<return: #Number>

	^ self primGetAlpha min: 1.0 max: 0.0
]

{ #category : #accessing }
SkiaPaint >> alpha: aFloat [
	"A float between 0 and 1"

	self primSetAlpha: (aFloat min: 1 max: 0)
]

{ #category : #accessing }
SkiaPaint >> antialias [
	<return: #Boolean>
	
	^ self primIsAntiAlias
]

{ #category : #accessing }
SkiaPaint >> antialias: aBoolean [	
	self primSetAntiAlias: aBoolean
]

{ #category : #accessing }
SkiaPaint >> blendMode [
	<return: #SkiaBlendMode>
	
	^ self primGetBlendMode
]

{ #category : #accessing }
SkiaPaint >> blendMode: aSkiaBlendMode [
	self primSetBlendMode: aSkiaBlendMode
]

{ #category : #accessing }
SkiaPaint >> capStyle [
	<return: #SkiaCapStyle>

	^ self primGetStrokeCap
]

{ #category : #accessing }
SkiaPaint >> capStyle: aSkiaCapStyle [
	self primSetStrokeCap: aSkiaCapStyle
]

{ #category : #accessing }
SkiaPaint >> color [
	<return: #Color>

	^ self primGetColor asColor
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

{ #category : #accessing }
SkiaPaint >> filterQuality [
	<return: #SkiaFilterQuality>
	
	^ self primGetFilterQuality
]

{ #category : #accessing }
SkiaPaint >> filterQuality: aSkiaFilterQuality [
	<return: #SkiaFilterQuality>
	
	self primSetFilterQuality: aSkiaFilterQuality
]

{ #category : #'gt-extension' }
SkiaPaint >> gtInfoFor: aView [
	<gtView>

	^ ({
		#alpha -> self alpha.
		#antialias -> self antialias.
		#blendMode -> self blendMode.
		#capStyle -> self capStyle.
		#color -> self color.
		#dither -> self dither.
		#filterQuality -> self filterQuality.
		#joinStyle -> self joinStyle.
		#paintStyle -> self paintStyle.
		#shader -> self shader.
		#strokeMiter -> self strokeMiter.
		#strokeWidth -> self strokeWidth.
	 } asOrderedDictionary gtItemsFor: aView)
			title: 'Info';
			priority: 2
]

{ #category : #testing }
SkiaPaint >> hasImageFilter [
	^ self primHasImageFilter
]

{ #category : #testing }
SkiaPaint >> hasPathEffect [
	^ self primHasPathEffect
]

{ #category : #accessing }
SkiaPaint >> imageFilter [
	<return: #SkiaImageFilter>
	
	^ SkiaImageFilter fromNativeHandle: self primGetImageFilter
]

{ #category : #accessing }
SkiaPaint >> imageFilter: aSkiaImageFilter [
	self primSetImageFilter: aSkiaImageFilter
]

{ #category : #accessing }
SkiaPaint >> joinStyle [
	<return: #SkiaJoinStyle>

	^ self primGetStrokeJoin
]

{ #category : #accessing }
SkiaPaint >> joinStyle: aSkiaJoinStyle [
	self primSetStrokeJoin: aSkiaJoinStyle
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

{ #category : #accessing }
SkiaPaint >> pathEffect [
	<return: #SkiaPathEffect>
	
	^ SkiaPathEffect fromNativeHandle: self primGetPathEffect
]

{ #category : #accessing }
SkiaPaint >> pathEffect: aSkiaPathEffect [
	self primSetPathEffect: aSkiaPathEffect
]

{ #category : #'private - ffi' }
SkiaPaint >> primGetAlpha [
	^ self ffiCall: #(float32 skia_paint_get_alpha_f(self))
]

{ #category : #'private - ffi' }
SkiaPaint >> primGetBlendMode [
	self ffiCall: #(SkiaBlendMode skia_paint_get_blend_mode(self))
]

{ #category : #'private - ffi' }
SkiaPaint >> primGetColor [
	self ffiCall: #(SkiaColor skia_paint_get_color(self))
]

{ #category : #'private - ffi' }
SkiaPaint >> primGetFilterQuality [
	self ffiCall: #(SkiaFilterQuality skia_paint_get_filter_quality(self))
]

{ #category : #'private - ffi' }
SkiaPaint >> primGetImageFilter [
	self ffiCall: #(void* skia_paint_get_image_filter(self))
]

{ #category : #'private - ffi' }
SkiaPaint >> primGetPaintStyle [
	self ffiCall: #(SkiaPaintStyle skia_paint_get_style(self))
]

{ #category : #'private - ffi' }
SkiaPaint >> primGetPathEffect [
	self ffiCall: #(void* skia_paint_get_path_effect(self))
]

{ #category : #'private - ffi' }
SkiaPaint >> primGetShader [
	self ffiCall: #(void* skia_paint_get_shader(self))
]

{ #category : #'private - ffi' }
SkiaPaint >> primGetStrokeCap [
	self ffiCall: #(SkiaCapStyle skia_paint_get_stroke_cap(self))
]

{ #category : #'private - ffi' }
SkiaPaint >> primGetStrokeJoin [
	self ffiCall: #(SkiaJoinStyle skia_paint_get_stroke_join(self))
]

{ #category : #'private - ffi' }
SkiaPaint >> primGetStrokeMiter [
	self ffiCall: #(scalar skia_paint_get_stroke_miter(self))
]

{ #category : #'private - ffi' }
SkiaPaint >> primGetStrokeWidth [
	self ffiCall: #(float32 skia_paint_get_stroke_width(self))
]

{ #category : #'private - ffi' }
SkiaPaint >> primHasImageFilter [
	self ffiCall: #(bool skia_paint_has_image_filter(self))
]

{ #category : #'private - ffi' }
SkiaPaint >> primHasPathEffect [
	self ffiCall: #(bool skia_paint_has_path_effect(self))
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
SkiaPaint >> primSetAlpha: anAlpha [
	self ffiCall: #(void skia_paint_set_alpha_f(self, float32 anAlpha))
]

{ #category : #'private - ffi' }
SkiaPaint >> primSetAntiAlias: isAntiAlias [
	self ffiCall: #(void skia_paint_set_anti_alias(self, bool isAntiAlias))
]

{ #category : #'private - ffi' }
SkiaPaint >> primSetBlendMode: aSkiaBlendMode [
	self ffiCall: #(void skia_paint_set_blend_mode(self, SkiaBlendMode aSkiaBlendMode))
]

{ #category : #'private - ffi' }
SkiaPaint >> primSetDither: isDither [
	self ffiCall: #(void skia_paint_set_dither(self, bool isDither))
]

{ #category : #'private - ffi' }
SkiaPaint >> primSetFilterQuality: aSkiaFilterQuality [
	self ffiCall: #(void skia_paint_set_filter_quality(self, SkiaFilterQuality aSkiaFilterQuality))
]

{ #category : #'private - ffi' }
SkiaPaint >> primSetImageFilter: aSkiaImageFilter [
	self ffiCall: #(void skia_paint_set_image_filter(self, SkiaImageFilter aSkiaImageFilter))
]

{ #category : #'private - ffi' }
SkiaPaint >> primSetPaintStyle: aPaintStyle [
	self ffiCall: #(void skia_paint_set_style(self, SkiaPaintStyle aPaintStyle))
]

{ #category : #'private - ffi' }
SkiaPaint >> primSetPathEffect: aSkiaPathEffect [
	self ffiCall: #(void skia_paint_set_path_effect(self, SkiaPathEffect aSkiaPathEffect))
]

{ #category : #'private - ffi' }
SkiaPaint >> primSetR: r g: g b: b a: a [
	self ffiCall: #(void skia_paint_set_rgba(self, uint8 r, uint8 g, uint8 b, uint8 a))
]

{ #category : #'private - ffi' }
SkiaPaint >> primSetShader: aSkiaShader [
	self ffiCall: #(void skia_paint_set_shader(self, SkiaShader aSkiaShader))
]

{ #category : #'private - ffi' }
SkiaPaint >> primSetStrokeCap: aSkiaCapStyle [
	self ffiCall: #(void skia_paint_set_stroke_cap(self, SkiaCapStyle aSkiaCapStyle))
]

{ #category : #'private - ffi' }
SkiaPaint >> primSetStrokeJoin: aSkiaJoinStyle [
	self ffiCall: #(void skia_paint_set_stroke_join(self, SkiaJoinStyle aSkiaJoinStyle))
]

{ #category : #'private - ffi' }
SkiaPaint >> primSetStrokeMiter: aStrokeMiter [
	self ffiCall: #(void skia_paint_set_stroke_miter(self, scalar aStrokeMiter))
]

{ #category : #'private - ffi' }
SkiaPaint >> primSetStrokeWidth: aWidth [
	self ffiCall: #(void skia_paint_set_stroke_width(self, float32 aWidth))
]

{ #category : #accessing }
SkiaPaint >> reset [
	self primReset
]

{ #category : #accessing }
SkiaPaint >> shader [
	<return: #SkiaShader>
	
	^ SkiaShader fromNativeHandle: self primGetShader
]

{ #category : #accessing }
SkiaPaint >> shader: aSkiaShader [
	self primSetShader: aSkiaShader
]

{ #category : #accessing }
SkiaPaint >> strokeMiter [
	<return: #Float>
	
	^ self primGetStrokeMiter
]

{ #category : #accessing }
SkiaPaint >> strokeMiter: aFloat [
	self primSetStrokeMiter: aFloat
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
