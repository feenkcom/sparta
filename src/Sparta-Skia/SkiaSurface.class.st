Class {
	#name : #SkiaSurface,
	#superclass : #SkiaExternalObject,
	#category : #'Sparta-Skia-External'
}

{ #category : #accessing }
SkiaSurface >> canvas [
	<return: #SkiaSurfaceCanvas>

	^ self subclassResponsibility
]

{ #category : #accessing }
SkiaSurface >> extent [
	"Return my extent as point (width @ height).
	extent can not be nil"
	<return: #Point>
	| aWidth aHeight |
	
	aWidth := self width.
	aHeight := self height. 

	^ aWidth @ aHeight
]

{ #category : #accessing }
SkiaSurface >> flush [
]

{ #category : #accessing }
SkiaSurface >> height [
	^ self subclassResponsibility
]

{ #category : #accessing }
SkiaSurface >> width [
	^ self subclassResponsibility
]
