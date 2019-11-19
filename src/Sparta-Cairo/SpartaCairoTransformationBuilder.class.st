Class {
	#name : #SpartaCairoTransformationBuilder,
	#superclass : #SpartaTransformationBuilder,
	#classTraits : 'TSpartaCairoLibrary classTrait',
	#category : #'Sparta-Cairo-Builders'
}

{ #category : #accessing }
SpartaCairoTransformationBuilder >> current [
	| aSpartaMatrix aCairoMatrix |

	aCairoMatrix := SpartaCairoMatrix new.
	self primGetTransform: aCairoMatrix.
	aSpartaMatrix := SpartaMatrix new
		x: aCairoMatrix x;
		y: aCairoMatrix y;
		sx: aCairoMatrix sx;
		sy: aCairoMatrix sy;
		shx: aCairoMatrix shx;
		shy: aCairoMatrix shy.
		
	^ aSpartaMatrix
]

{ #category : #transformation }
SpartaCairoTransformationBuilder >> pop [
	self primSetTransform: (SpartaCairoMatrix fromSpartaMatrix: canvas popTransform)
]

{ #category : #'private - ffi' }
SpartaCairoTransformationBuilder >> primApplyTransform: aCairoMatrix [

	^ self ffiCall: #( void cairo_transform (
		SpartaCairoCanvas canvas,
		SpartaCairoMatrix *aCairoMatrix) )
]

{ #category : #'private - ffi' }
SpartaCairoTransformationBuilder >> primGetTransform: aCairoMatrix [

	^ self ffiCall: #( void cairo_get_matrix (
		SpartaCairoCanvas canvas,
		SpartaCairoMatrix *aCairoMatrix) )
]

{ #category : #'private - ffi' }
SpartaCairoTransformationBuilder >> primSetTransform: aCairoMatrix [

	^ self ffiCall: #( void cairo_set_matrix (
		SpartaCairoCanvas canvas,
		SpartaCairoMatrix *aCairoMatrix) )
]

{ #category : #transformation }
SpartaCairoTransformationBuilder >> push: aSpartaTransformation [

	"save current"
	canvas pushTransform: self current.

	"then set new"
	self primApplyTransform: (SpartaCairoMatrix fromSpartaMatrix: aSpartaTransformation asMatrix)
]
