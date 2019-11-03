Class {
	#name : #SkiaPathBuilder,
	#superclass : #Object,
	#traits : 'TSpartaPathBuilder',
	#classTraits : 'TSpartaPathBuilder classTrait',
	#instVars : [
		'path',
		'isAbsolute'
	],
	#category : #'Sparta-Skia-Builders'
}

{ #category : #'instance creation' }
SkiaPathBuilder class >> evenOdd: aSpartaCanvas [
	^ self new fillType: SkiaPathFillType EvenOdd
]

{ #category : #'instance creation' }
SkiaPathBuilder class >> winding: aSpartaCanvas [
	^ self new fillType: SkiaPathFillType Winding
]

{ #category : #'path commands' }
SkiaPathBuilder >> absolute [
	isAbsolute := true
]

{ #category : #accessing }
SkiaPathBuilder >> canvas: aCanvas [
	"we don't need canvas"
]

{ #category : #'path commands' }
SkiaPathBuilder >> close [
	"Close the current figure, this will essentially generate a line segment
 	from the current point to the starting point for the current figure"
	
	path close
]

{ #category : #accessing }
SkiaPathBuilder >> fillType: aSkiaPathFillType [
	path fillType: aSkiaPathFillType
]

{ #category : #'path commands' }
SkiaPathBuilder >> finish [
	^ path
]

{ #category : #initialization }
SkiaPathBuilder >> initialize [
	super initialize.
	
	path := SkiaPath new.
	isAbsolute := true
]

{ #category : #'path commands' }
SkiaPathBuilder >> lineTo: aPoint [
	path lineTo: aPoint absolute: isAbsolute
]

{ #category : #'path commands' }
SkiaPathBuilder >> moveTo: aPoint [
	path moveTo: aPoint absolute: isAbsolute
]

{ #category : #'path commands' }
SkiaPathBuilder >> relative [
	isAbsolute := false
]

{ #category : #accessing }
SkiaPathBuilder >> reset [
	isAbsolute := true.
	path := SkiaPath new
]
