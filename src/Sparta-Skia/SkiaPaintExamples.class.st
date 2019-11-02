Class {
	#name : #SkiaPaintExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #'examples - paint' }
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
	self assert: aPaint strokeWidth equals: 0.0.
	self assert: aPaint strokeMiter equals: 4.0.
	self assert: aPaint color equals: Color black.
	
	^ aPaint
]

{ #category : #'examples - paint' }
SkiaPaintExamples >> setAlpha [
	<gtExample>
	| aPaint |
	
	aPaint := self default.
	aPaint alpha: 0.5.
	
	self assert: (aPaint alpha closeTo: 0.5).
	
	^ aPaint
]

{ #category : #'examples - paint' }
SkiaPaintExamples >> setAntialias [
	<gtExample>
	| aPaint |
	
	aPaint := self default.
	aPaint antialias: true.
	
	self assert: aPaint antialias.
	
	^ aPaint
]

{ #category : #'examples - paint' }
SkiaPaintExamples >> setBlendMode [
	<gtExample>
	| aPaint |
	
	aPaint := self default.
	aPaint blendMode: SkiaBlendMode SoftLight.
	
	self assert: aPaint blendMode equals: SkiaBlendMode SoftLight.
	
	^ aPaint
]

{ #category : #'examples - paint' }
SkiaPaintExamples >> setCapStyle [
	<gtExample>
	| aPaint |
	
	aPaint := self default.
	aPaint capStyle: SkiaCapStyle Round.
	
	self assert: aPaint capStyle equals: SkiaCapStyle Round.
	
	^ aPaint
]

{ #category : #'examples - paint' }
SkiaPaintExamples >> setDither [
	<gtExample>
	| aPaint |
	
	aPaint := self default.
	aPaint dither: true.
	
	self assert: aPaint dither.
	
	^ aPaint
]

{ #category : #'examples - paint' }
SkiaPaintExamples >> setJoinStyle [
	<gtExample>
	| aPaint |
	
	aPaint := self default.
	aPaint joinStyle: SkiaJoinStyle Bevel.
	
	self assert: aPaint joinStyle equals: SkiaJoinStyle Bevel.
	
	^ aPaint
]

{ #category : #'examples - paint' }
SkiaPaintExamples >> setPaintStyle [
	<gtExample>
	| aPaint |
	
	aPaint := self default.
	aPaint paintStyle: SkiaPaintStyle StrokeAndFill.
	
	self assert: aPaint paintStyle equals: SkiaPaintStyle StrokeAndFill.
	
	^ aPaint
]

{ #category : #'examples - paint' }
SkiaPaintExamples >> setStrokeMiter [
	<gtExample>
	| aPaint |
	
	aPaint := self default.
	aPaint strokeMiter: 10.
	
	self assert: aPaint strokeMiter equals: 10.
	
	^ aPaint
]

{ #category : #'examples - paint' }
SkiaPaintExamples >> setStrokeWidth [
	<gtExample>
	| aPaint |
	
	aPaint := self default.
	aPaint strokeWidth: 10.
	
	self assert: aPaint strokeWidth equals: 10.
	
	^ aPaint
]
