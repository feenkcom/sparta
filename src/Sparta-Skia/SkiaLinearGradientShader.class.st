Class {
	#name : #SkiaLinearGradientShader,
	#superclass : #SkiaGradientShader,
	#category : 'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaLinearGradientShader class >> from: aFromPoint to: aToPoint colors: theColors positions: thePositions mode: aTileMode flags: theBitFlags matrix: aSpartaMatrixOrNil [	
	^ self fromNativeHandle: (self
		primCreateFrom: (GtBoxerPointF32 fromPoint: aFromPoint)
		to: (GtBoxerPointF32 fromPoint: aToPoint)
		colors: (SkiaArrayColor fromColors: theColors)
		positions: (GtBoxerArrayF32 withAll: thePositions)
		mode: aTileMode
		flags: theBitFlags
		matrix: (SkiaMatrix fromSpartaMatrix: aSpartaMatrixOrNil))
]

{ #category : #'private - ffi' }
SkiaLinearGradientShader class >> primCreateFrom: aFromPoint to: aToPoint colors: theColors positions: thePositions mode: aTileMode flags: theBitFlags matrix: anOptionalMatrix [
	^ self ffiCall: #(void* skia_gradient_linear_create(
		GtBoxerPointF32 aFromPoint,
		GtBoxerPointF32 aToPoint,
		SkiaArrayColor theColors,
		GtBoxerArrayF32 thePositions,
		SkiaTileMode aTileMode,
		uint32 theBitFlags,
		SkiaMatrix anOptionalMatrix
	))
]
