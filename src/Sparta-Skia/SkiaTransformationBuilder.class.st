Class {
	#name : #SkiaTransformationBuilder,
	#superclass : #SpartaTransformationBuilder,
	#category : #'Sparta-Skia-Builders'
}

{ #category : #accessing }
SkiaTransformationBuilder >> current [
	"Return a current transformation matrix of the canvas"
	<return: #SpartaMatrix>

	^ canvas surfaceCanvas getMatrix
]

{ #category : #transformation }
SkiaTransformationBuilder >> pop [
	canvas surfaceCanvas restore
]

{ #category : #transformation }
SkiaTransformationBuilder >> push: aSpartaTransformation [
	| aSurfaceCanvas |
	
	aSurfaceCanvas := canvas surfaceCanvas.
	
	aSurfaceCanvas save.
	
	aSpartaTransformation operationsDo: [ :eachOperation |
		eachOperation translationDo: [ :x :y | aSurfaceCanvas translateX: x Y: y ].
		eachOperation scaleDo: [ :x :y | aSurfaceCanvas scaleX: x Y: y ].
		eachOperation rotationDo: [ :degrees | ].
		eachOperation concatenationDo: [ :matrix | aSurfaceCanvas concatMatrix: matrix ] ]
]
