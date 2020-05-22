Class {
	#name : #SkiaCompositionTransformationLayer,
	#superclass : #SkiaCompositionLayer,
	#category : #'Sparta-Skia-External'
}

{ #category : #accessing }
SkiaCompositionTransformationLayer class >> matrix: aSpartaMatrix [
	^ SkiaMatrix
		fromSpartaMatrix: aSpartaMatrix
		during: [ :aSkiaMatrix | self fromNativeHandle: (self primCreateMatrix: aSkiaMatrix) ]
]

{ #category : #'private - ffi' }
SkiaCompositionTransformationLayer class >> primCreate [
	^ self ffiCall: #(void* skia_transformation_layer_new())
]

{ #category : #'private - ffi' }
SkiaCompositionTransformationLayer class >> primCreateMatrix: aSkiaMatrix [
	^ self ffiCall: #(void* skia_transformation_layer_new_matrix(SkiaMatrix aSkiaMatrix))
]
