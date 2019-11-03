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
SkiaTransformationBuilder >> push: aSpartaMatrix [
	canvas surfaceCanvas
		save;
		concatMatrix: aSpartaMatrix
]
