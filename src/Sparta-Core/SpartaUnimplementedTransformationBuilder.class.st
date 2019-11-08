Class {
	#name : #SpartaUnimplementedTransformationBuilder,
	#superclass : #SpartaTransformationBuilder,
	#category : #'Sparta-Core-Builders - Unimplemented'
}

{ #category : #accessing }
SpartaUnimplementedTransformationBuilder >> current [
	"Return a current transformation matrix of the canvas"
	<return: #SpartaMatrix>

	^ SpartaMatrix new
]

{ #category : #transformation }
SpartaUnimplementedTransformationBuilder >> pop [
]

{ #category : #transformation }
SpartaUnimplementedTransformationBuilder >> push: aSpartaMatrix [
]