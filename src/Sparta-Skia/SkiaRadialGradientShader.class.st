Class {
	#name : 'SkiaRadialGradientShader',
	#superclass : 'SkiaGradientShader',
	#category : 'Sparta-Skia-External'
}

{ #category : 'instance creation' }
SkiaRadialGradientShader class >> center: aCenterPoint radius: aRadius colors: theColors positions: thePositions mode: aTileMode flags: theBitFlags matrix: aSpartaMatrixOrNil [	
	^ self fromNativeHandle: (self
		primCreateAt: (GtBoxerPointF32 fromPoint: aCenterPoint)
		radius: aRadius
		colors: (SkiaArrayColor fromColors: theColors)
		positions: (GtBoxerArrayF32 withAll: thePositions)
		mode: aTileMode
		flags: theBitFlags
		matrix: (SkiaMatrix fromSpartaMatrix: aSpartaMatrixOrNil))
]

{ #category : 'private - ffi' }
SkiaRadialGradientShader class >> primCreateAt: aCenter radius: aRadius colors: theColors positions: thePositions mode: aTileMode flags: theBitFlags matrix: anOptionalMatrix [
	^ self ffiCall: #(void* skia_gradient_radial_create(
		GtBoxerPointF32 aCenter,
		scalar aRadius,
		SkiaArrayColor theColors,
		GtBoxerArrayF32 thePositions,
		SkiaTileMode aTileMode,
		uint32 theBitFlags,
		SkiaMatrix anOptionalMatrix
	))
]
