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
SkiaTransformationBuilder >> pop: aSpartaTransformation [
	| aSurfaceCanvas |
	
	aSurfaceCanvas := canvas surfaceCanvas.

	aSpartaTransformation isReversable
		ifFalse: [ ^ aSurfaceCanvas restore ].

	aSpartaTransformation operationsDo: [ :eachOperation |
		eachOperation reverseTranslationDo: [ :x :y | aSurfaceCanvas translateX: x Y: y ].
		eachOperation reverseScaleDo: [ :x :y | aSurfaceCanvas scaleX: x Y: y ].
		eachOperation reverseRotationDo: [ :degrees | ].
		eachOperation reverseConcatenationDo: [ :matrix | aSurfaceCanvas concatMatrix: matrix ] ]
]

{ #category : #transformation }
SkiaTransformationBuilder >> push: aSpartaTransformation [
	| aSurfaceCanvas |
	
	aSurfaceCanvas := canvas surfaceCanvas.
	
	aSpartaTransformation isReversable
		ifFalse: [ aSurfaceCanvas save ].
	
	aSpartaTransformation operationsDo: [ :eachOperation |
		eachOperation translationDo: [ :x :y | aSurfaceCanvas translateX: x Y: y ].
		eachOperation scaleDo: [ :x :y | aSurfaceCanvas scaleX: x Y: y ].
		eachOperation rotationDo: [ :degrees | ].
		eachOperation concatenationDo: [ :matrix | aSurfaceCanvas concatMatrix: matrix ] ]
]
