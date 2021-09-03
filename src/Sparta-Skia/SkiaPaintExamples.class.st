Class {
	#name : 'SkiaPaintExamples',
	#superclass : 'SkiaExternalObjectExamples',
	#category : 'Sparta-Skia-Examples'
}

{ #category : 'examples - paint' }
SkiaPaintExamples >> default [
	<gtExample>
	| aPaint |
	
	aPaint := SkiaPaint new.
	self assert: aPaint alpha equals: 1.
	self assert: aPaint antialias not.
	self assert: aPaint blendMode equals: SkiaBlendMode SrcOver.
	self assert: aPaint capStyle equals: SkiaCapStyle Butt.
	self assert: aPaint dither not.
	self assert: aPaint joinStyle equals: SkiaJoinStyle Miter.
	self assert: aPaint paintStyle equals: SkiaPaintStyle Fill.
	self assert: aPaint shader isNull.
	self assert: aPaint strokeWidth equals: 0.0.
	self assert: aPaint strokeMiter equals: 4.0.
	self assert: aPaint color equals: Color black.
	
	^ aPaint
]

{ #category : 'examples - paint' }
SkiaPaintExamples >> setAlpha [
	<gtExample>
	| aPaint |
	
	aPaint := self default.
	aPaint alpha: 0.5.
	
	self assert: (aPaint alpha closeTo: 0.5).
	
	^ aPaint
]

{ #category : 'examples - paint' }
SkiaPaintExamples >> setAntialias [
	<gtExample>
	| aPaint |
	
	aPaint := self default.
	aPaint antialias: true.
	
	self assert: aPaint antialias.
	
	^ aPaint
]

{ #category : 'examples - paint' }
SkiaPaintExamples >> setBlendMode [
	<gtExample>
	| aPaint |
	
	aPaint := self default.
	aPaint blendMode: SkiaBlendMode SoftLight.
	
	self assert: aPaint blendMode equals: SkiaBlendMode SoftLight.
	
	^ aPaint
]

{ #category : 'examples - paint' }
SkiaPaintExamples >> setCapStyle [
	<gtExample>
	| aPaint |
	
	aPaint := self default.
	aPaint capStyle: SkiaCapStyle Round.
	
	self assert: aPaint capStyle equals: SkiaCapStyle Round.
	
	^ aPaint
]

{ #category : 'examples - paint' }
SkiaPaintExamples >> setDither [
	<gtExample>
	| aPaint |
	
	aPaint := self default.
	aPaint dither: true.
	
	self assert: aPaint dither.
	
	^ aPaint
]

{ #category : 'examples - paint' }
SkiaPaintExamples >> setImageFilter [
	<gtExample>
	| aPaint anImageFilter |
	
	anImageFilter := SkiaImageFilterBlur sigma: 3@3.
	self assert: anImageFilter isNull not.
	
	aPaint := self default.

	"initially no image filter"
	self assert: aPaint hasImageFilter not.
	aPaint imageFilter: anImageFilter.
	self assert: aPaint hasImageFilter.
	
	"paint does not consume an image filter"
	self assert: anImageFilter isNull not.
	self assert: (GtBoxerValueBox boxedPointerOf: anImageFilter) isNull not.
	
	"dropping the image filter does not drop it in the paint"
	anImageFilter release.
	self assert: anImageFilter isNull.
	self assert: (GtBoxerValueBox boxedPointerOf: anImageFilter) isNull.
	self assert: aPaint hasImageFilter.

	^ aPaint
]

{ #category : 'examples - paint' }
SkiaPaintExamples >> setJoinStyle [
	<gtExample>
	| aPaint |
	
	aPaint := self default.
	aPaint joinStyle: SkiaJoinStyle Bevel.
	
	self assert: aPaint joinStyle equals: SkiaJoinStyle Bevel.
	
	^ aPaint
]

{ #category : 'examples - paint' }
SkiaPaintExamples >> setPaintStyle [
	<gtExample>
	| aPaint |
	
	aPaint := self default.
	aPaint paintStyle: SkiaPaintStyle StrokeAndFill.
	
	self assert: aPaint paintStyle equals: SkiaPaintStyle StrokeAndFill.
	
	^ aPaint
]

{ #category : 'examples - paint' }
SkiaPaintExamples >> setShader [
	<gtExample>
	| aPaint aShader |
	
	aShader := SkiaLinearGradientShader
		from: (0@0) to: (50@50)
		colors: { Color black . Color white }
		positions: { 0 . 1 }
		mode: SkiaTileMode Clamp
		flags: 0
		matrix: SpartaMatrix new.

	aPaint := self default.

	"initially no shader"
	self assert: aPaint shader isNull.
	aPaint shader: aShader.
	self assert: aPaint shader isNull not.
	
	"paint does not consume an shader"
	self assert: aShader isNull not.
	self assert: (GtBoxerValueBox boxedPointerOf: aShader) isNull not.

	^ aPaint
]

{ #category : 'examples - paint' }
SkiaPaintExamples >> setStrokeMiter [
	<gtExample>
	| aPaint |
	
	aPaint := self default.
	aPaint strokeMiter: 10.
	
	self assert: aPaint strokeMiter equals: 10.
	
	^ aPaint
]

{ #category : 'examples - paint' }
SkiaPaintExamples >> setStrokeWidth [
	<gtExample>
	| aPaint |
	
	aPaint := self default.
	aPaint strokeWidth: 10.
	
	self assert: aPaint strokeWidth equals: 10.
	
	^ aPaint
]
