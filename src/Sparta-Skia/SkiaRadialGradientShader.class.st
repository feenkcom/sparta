Class {
	#name : #SkiaRadialGradientShader,
	#superclass : #SkiaGradientShader,
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaRadialGradientShader class >> center: aCenterPoint radius: aRadius colors: theColors positions: thePositions mode: aTileMode flags: theBitFlags matrix: aSpartaMatrixOrNil [
	^ self ffiLibrary
		newArrayF32WithAll: thePositions
		during: [ :thePositionsArrayF32 |
			self fromNativeHandle: (self
				primCreateAt: (self ffiLibrary newPointF32: aCenterPoint)
				radius: aRadius
				colors: (SkiaArrayColor fromColors: theColors)
				positions: thePositionsArrayF32
				mode: aTileMode
				flags: theBitFlags
				matrix: (SkiaMatrix fromSpartaMatrix: aSpartaMatrixOrNil)) ]
]

{ #category : #'private - ffi' }
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
