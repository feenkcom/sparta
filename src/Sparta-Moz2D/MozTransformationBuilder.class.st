Class {
	#name : #MozTransformationBuilder,
	#superclass : #SpartaTransformationBuilder,
	#category : #'Sparta-Moz2D-Builders'
}

{ #category : #'library path' }
MozTransformationBuilder class >> ffiLibraryName [
	^ MozLibrary
]

{ #category : #accessing }
MozTransformationBuilder >> current [
	^ self privGetTransform
]

{ #category : #drawing }
MozTransformationBuilder >> drawSurface: aSpartaSurface transformed: aMatrix3D [
	| anArray isSuccess |

	anArray := FFIExternalArray externalNewType: 'float' size: 16.
	
	anArray at: 1 put: aMatrix3D sx.
	anArray at: 2 put: aMatrix3D shy0.
	anArray at: 3 put: aMatrix3D shz0.
	anArray at: 4 put: aMatrix3D wx.
	anArray at: 5 put: aMatrix3D shx0.
	anArray at: 6 put: aMatrix3D sy.
	anArray at: 7 put: aMatrix3D shz1.
	anArray at: 8 put: aMatrix3D wy.
	anArray at: 9 put: aMatrix3D shx1.
	anArray at: 10 put: aMatrix3D shy1.
	anArray at: 11 put: aMatrix3D sz.
	anArray at: 12 put: aMatrix3D wz.
	anArray at: 13 put: aMatrix3D x.
	anArray at: 14 put: aMatrix3D y.
	anArray at: 15 put: aMatrix3D z.
	anArray at: 16 put: aMatrix3D w.
	
	isSuccess := self primDrawSurface: aSpartaSurface matrix: anArray getHandle.
	
	anArray free
]

{ #category : #'library path' }
MozTransformationBuilder >> ffiLibraryName [
	^ self class ffiLibraryName
]

{ #category : #transformation }
MozTransformationBuilder >> pop: aSpartaTransformation [
	self primPopTransform
]

{ #category : #'private - ffi' }
MozTransformationBuilder >> primConcatenateTransformA11: a11 a12: a12 a21: a21 a22: a22 a31: a31 a32: a32 [

	^ self ffiCall: #( void moz2d_draw_target_transform_concatenate (MozCanvas canvas, float a11, float a12, float a21, float a22, float a31, float a32) )
]

{ #category : #'private - ffi' }
MozTransformationBuilder >> primDrawSurface: aSurface matrix: aRawMatrixArray [

	^ self ffiCall: #(bool moz2d_draw_target_draw_3d_transformed (
		MozCanvas canvas,
		MozSurface aSurface,
		float* aRawMatrixArray ))
]

{ #category : #'private - ffi' }
MozTransformationBuilder >> primGetTransform: anArray [

	^ self ffiCall: #( void moz2d_draw_target_transform_get (MozCanvas canvas, float* anArray) )
]

{ #category : #'private - ffi' }
MozTransformationBuilder >> primPopTransform [

	^ self ffiCall: #( void moz2d_draw_target_transform_pop ( MozCanvas canvas ) )
]

{ #category : #'private - ffi' }
MozTransformationBuilder >> primPushTransform [

	^ self ffiCall: #( void moz2d_draw_target_transform_push ( MozCanvas canvas ) )
]

{ #category : #private }
MozTransformationBuilder >> privGetTransform [
	|externalArray|
	externalArray := FFIExternalArray externalNewType: 'float' size: 6.
	self primGetTransform: externalArray getHandle.
	^ SpartaMatrix fromExternalArray: externalArray
]

{ #category : #transformation }
MozTransformationBuilder >> push: aSpartaTransformation [
	| aSpartaMatrix |
	self primPushTransform.
	
	aSpartaTransformation isIdentity
		ifTrue: [ ^ self ].

	aSpartaMatrix := aSpartaTransformation asMatrix.

	self
		primConcatenateTransformA11: aSpartaMatrix sx
		a12: aSpartaMatrix shy
		a21: aSpartaMatrix shx
		a22: aSpartaMatrix sy
		a31: aSpartaMatrix x
		a32: aSpartaMatrix y
]
