Class {
	#name : 'SkiaConicalGradientShader',
	#superclass : 'SkiaGradientShader',
	#category : 'Sparta-Skia-External'
}

{ #category : 'private - ffi' }
SkiaConicalGradientShader class >> primCreateStart: aStartPoint radius: aStartRadius end: anEndPoint radius: anEndRadius colors: theColors positions: thePositions mode: aTileMode flags: theBitFlags matrix: anOptionalMatrix [
	^ self ffiCall: #(void* skia_gradient_two_point_conical_create(
		GtBoxerPointF32 aStartPoint,
		scalar aStartRadius,
		GtBoxerPointF32 anEndPoint,
		scalar anEndRadius,
		SkiaArrayColor theColors,
		GtBoxerArrayF32 thePositions,
		SkiaTileMode aTileMode,
		uint32 theBitFlags,
		SkiaMatrix anOptionalMatrix
	))
]

{ #category : 'instance creation' }
SkiaConicalGradientShader class >> start: aStartPoint radius: aStartRadius end: anEndPoint radius: anEndRadius colors: theColors positions: thePositions mode: aTileMode flags: theBitFlags matrix: aSpartaMatrixOrNil [	
	^ self fromNativeHandle: (self
		primCreateStart: (GtBoxerPointF32 fromPoint: aStartPoint)
		radius: aStartRadius
		end: (GtBoxerPointF32 fromPoint: anEndPoint)
		radius: anEndRadius
		colors: (SkiaArrayColor fromColors: theColors)
		positions: (GtBoxerArrayF32 withAll: thePositions)
		mode: aTileMode
		flags: theBitFlags
		matrix: (SkiaMatrix fromSpartaMatrix: aSpartaMatrixOrNil))
]
