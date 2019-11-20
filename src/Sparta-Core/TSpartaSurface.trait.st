"
I declare an API of a surface that can be used as a paint or used in various drawing operations.

Surface can play a role of a source by filter primitives. 
Surface can be rendered on a canvas with 3D transformation.
Surface can be rendered with shadow on a canvas.
Surface can be used as a paint in fill or stroke.
Surface can be used used as mask

Internal Representation and Key Implementation Points.

    Surface is supposed to be backend specific
"
Trait {
	#name : #TSpartaSurface,
	#category : #'Sparta-Core'
}

{ #category : #converting }
TSpartaSurface >> asFilterSecondSourceOn: aFilter [
	aFilter secondSourceSurface: self
]

{ #category : #converting }
TSpartaSurface >> asFilterSourceOn: aFilter [
	aFilter sourceSurface: self
]

{ #category : #converting }
TSpartaSurface >> asSpartaPaintOn: aSpartaCanvas [
	^ aSpartaCanvas paint surface source: self; samplingPoint
]

{ #category : #accessing }
TSpartaSurface >> bounds [
	"Return my bounds in device (global) space coordinate system.
	Origin is always set to 0@0, while extent equals to my actual extent.
	bounds can not be nil"
	<return: #Rectangle>

	^ 0@0 extent: self extent
]

{ #category : #accessing }
TSpartaSurface >> extent [
	"Return my extent as point (width @ height).
	extent can not be nil"
	<return: #Point>
	
	^ self explicitRequirement
]

{ #category : #accessing }
TSpartaSurface >> height [
	^ self extent y
]

{ #category : #accessing }
TSpartaSurface >> snapshot [
	^ self
]

{ #category : #accessing }
TSpartaSurface >> snapshotDuring: aBlock [
	"I am similar to #snaphot but I guarantee that snapshot is not auto-released
	and is destroyed after evaluation of the block.
	Default implementation simply passes snaphot to the block"

	aBlock value: self snapshot
]

{ #category : #dispatch }
TSpartaSurface >> spartaMaskOn: aSpartaCanvas with: aMaskPainter [

	aMaskPainter maskSurface: self
]

{ #category : #accessing }
TSpartaSurface >> surface [
	^ self
]

{ #category : #accessing }
TSpartaSurface >> width [
	^ self extent x
]
