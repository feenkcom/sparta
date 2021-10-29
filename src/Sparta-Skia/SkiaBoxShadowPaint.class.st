Class {
	#name : #SkiaBoxShadowPaint,
	#superclass : #Object,
	#traits : 'TSpartaPaint + TSpartaBoxShadowPaint',
	#classTraits : 'TSpartaPaint classTrait + TSpartaBoxShadowPaint classTrait',
	#instVars : [
		'matrix',
		'color',
		'offset',
		'radius'
	],
	#category : 'Sparta-Skia-Paints'
}

{ #category : #'extend modes' }
SkiaBoxShadowPaint >> clamp [
]

{ #category : #accessing }
SkiaBoxShadowPaint >> color [
	^ color
]

{ #category : #accessing }
SkiaBoxShadowPaint >> color: aColor [
	color := aColor
]

{ #category : #initialization }
SkiaBoxShadowPaint >> initialize [
	super initialize.
	
	color := self class defaultColor.
	offset := self class defaultOffset.
	radius := self class defaultRadius
]

{ #category : #accessing }
SkiaBoxShadowPaint >> offset [
	^ offset
]

{ #category : #accessing }
SkiaBoxShadowPaint >> offset: aPoint [
	offset := aPoint asPoint
]

{ #category : #accessing }
SkiaBoxShadowPaint >> radius [
	^ radius
]

{ #category : #accessing }
SkiaBoxShadowPaint >> radius: aNumber [
	radius := aNumber asPoint
]

{ #category : #'extend modes' }
SkiaBoxShadowPaint >> reflect [
]

{ #category : #'extend modes' }
SkiaBoxShadowPaint >> repeat [
]

{ #category : #'extend modes' }
SkiaBoxShadowPaint >> repeatX [
]

{ #category : #'extend modes' }
SkiaBoxShadowPaint >> repeatY [
]

{ #category : #accessing }
SkiaBoxShadowPaint >> transformation: aMatrix [
	matrix := aMatrix
]
