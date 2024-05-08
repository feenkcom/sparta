Class {
	#name : #SkiaSvgCanvas,
	#superclass : #SkiaCanvas,
	#instVars : [
		'origin',
		'extent'
	],
	#category : #'Sparta-Skia-Core'
}

{ #category : #rendering }
SkiaSvgCanvas >> drawDuring: aBlock [
	"SVG canvas is special in a sence that the underlying surface should be created every frame from scratch.
	Users of this canvas must wrap the drawing calls within the block using this method"
	
	^ SkiaSvgSurface
		bounds: (self origin extent: self extent)
		during: [ :aSkiaSurface |
			| anSVG |
			skiaSurface := aSkiaSurface.
			skiaSurfaceCanvas := aSkiaSurface canvas.
			
			aBlock cull: self.
			anSVG := skiaSurface end.
			
			skiaSurfaceCanvas := nil.
			skiaSurface := nil.
			anSVG ]
]

{ #category : #accessing }
SkiaSvgCanvas >> extent [
	^ extent
]

{ #category : #accessing }
SkiaSvgCanvas >> extent: anObject [
	extent := anObject
]

{ #category : #initialization }
SkiaSvgCanvas >> initialize [
	super initialize.
	
	origin := 0@0.
	extent := 1@1
]

{ #category : #accessing }
SkiaSvgCanvas >> origin [
	^ origin
]

{ #category : #accessing }
SkiaSvgCanvas >> origin: anObject [
	origin := anObject
]

{ #category : #'instance creation' }
SkiaSvgCanvas >> similar: anExtent [
	"Create a new empty canvas of the same type and format with a given size.
	anExtent must not be nil"
	<return: #SpartaCanvas>
	
	^ self copy extent: anExtent
]
