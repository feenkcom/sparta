Class {
	#name : #SkiaStrokeOptions,
	#superclass : #Object,
	#traits : 'TSpartaStrokeOptions',
	#classTraits : 'TSpartaStrokeOptions classTrait',
	#instVars : [
		'width',
		'dashOffset',
		'dashPattern',
		'miterLimit'
	],
	#category : #'Sparta-Skia-Core'
}

{ #category : #accessing }
SkiaStrokeOptions >> dashOffset: aFloat [
	dashOffset := aFloat
]

{ #category : #accessing }
SkiaStrokeOptions >> dashPattern: anArrayOfFloats [
	dashPattern := anArrayOfFloats
]

{ #category : #accessing }
SkiaStrokeOptions >> miterLimit: aFloat [
	miterLimit := aFloat
]

{ #category : #accessing }
SkiaStrokeOptions >> width: aFloat [
	width := aFloat
]
