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
	canvas surfaceCanvas
		save;
		concatMatrix: aSpartaTransformation asMatrix
]
