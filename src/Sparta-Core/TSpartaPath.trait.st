"
I am a path used to create (sets of) figures of any shape that can be filled or stroked to a canvas.
I can also be used to clip a region on the canvas.

Path is usually backend specific and has to be created using PathBuilder which can be optained from canvas.

Public API and Key Messages

- bounds - get  my bounds
- strokedBounds - get bounds of the stroke if I would be stroked with provided stroke options
"
Trait {
	#name : #TSpartaPath,
	#category : #'Sparta-Core-Path'
}

{ #category : #converting }
TSpartaPath >> asSpartaPathOn: aSpartaCanvas [
	^ self
]

{ #category : #'geometry - testing' }
TSpartaPath >> containsPoint: aPoint on: aSpartaCanvas [
	"Return true if a given point lies within this path as if it would be filled"
	<return: #Boolean>

	^ self explicitRequirement
]

{ #category : #dispatch }
TSpartaPath >> spartaClipOn: aSpartaCanvas with: aSpartaClipper [
	aSpartaClipper pushPath: self
]

{ #category : #dispatch }
TSpartaPath >> spartaFillOn: aSpartaCanvas with: aSpartaPainter [
	aSpartaPainter fillPath: self
]

{ #category : #dispatch }
TSpartaPath >> spartaStrokeOn: aSpartaCanvas with: aSpartaFiller [
	aSpartaFiller strokePath: self
]

{ #category : #'geometry - testing' }
TSpartaPath >> strokeContainsPoint: aPoint options: aStrokeOptions on: aSpartaCanvas [
	"Return true if a given point lies within this path as if it would be stroked with provided stroke options"
	<return: #Boolean>

	^ self explicitRequirement
]

{ #category : #'geometry - accessing' }
TSpartaPath >> strokedBoundsOn: aSpartaCanvas with: aStrokeOptions [
	"Return the bounds of the stroke of this path using the specified strokeoptions.
	These bounds are not guaranteed to be tight."
	<return: #Rectangle>

	^ self explicitRequirement
]
