Class {
	#name : #SkiaCompositionTransformationLayer,
	#superclass : #SkiaCompositionLayer,
	#category : #'Sparta-Skia-Compositor'
}

{ #category : #accessing }
SkiaCompositionTransformationLayer class >> matrix: aSpartaMatrix [
	^ SkiaCompositorMatrix
		matrix: aSpartaMatrix
		during: [ :aSkiaCompositorMatrix | self fromNativeHandle: (self primCreateMatrix: aSkiaCompositorMatrix) ]
]

{ #category : #'private - ffi' }
SkiaCompositionTransformationLayer class >> primCreateMatrix: aSkiaCompositorMatrix [
	^ self ffiCall: #(void* compositor_transformation_layer_new(SkiaCompositorMatrix aSkiaCompositorMatrix))
]
