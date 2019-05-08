Class {
	#name : #SpartaShadowPainter,
	#superclass : #SpartaAbstractPainter,
	#instVars : [
		'destination',
		'offset',
		'color',
		'sigma',
		'source'
	],
	#category : #'Sparta-Core-Builders'
}

{ #category : #accessing }
SpartaShadowPainter >> color [
	^ color
]

{ #category : #accessing }
SpartaShadowPainter >> color: aColor [
	color := aColor
]

{ #category : #accessing }
SpartaShadowPainter >> destination [
	^ destination
]

{ #category : #accessing }
SpartaShadowPainter >> destination: aPoint [
	"Destination point that this drawing operation should draw to."
	destination := aPoint
]

{ #category : #accessing }
SpartaShadowPainter >> offset [
	^ offset
]

{ #category : #accessing }
SpartaShadowPainter >> offset: aPoint [
	"Offset of the shadow"
	offset := aPoint
]

{ #category : #'initialize-release' }
SpartaShadowPainter >> reset [
	super reset.
	
	source := nil.
	offset := 0@0.
	destination := 0@0.
	color := Color black.
	sigma := 4
]

{ #category : #accessing }
SpartaShadowPainter >> sigma [
	^ sigma
]

{ #category : #accessing }
SpartaShadowPainter >> sigma: aNumber [
	"Sigma used for the guassian filter kernel"
	sigma := aNumber
]

{ #category : #accessing }
SpartaShadowPainter >> source [
	^ source
]

{ #category : #accessing }
SpartaShadowPainter >> source: aSurface [
	source := aSurface
]
