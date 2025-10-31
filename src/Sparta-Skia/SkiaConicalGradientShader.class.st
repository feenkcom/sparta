Class {
	#name : #SkiaConicalGradientShader,
	#superclass : #SkiaGradientShader,
	#category : #'Sparta-Skia-External'
}

{ #category : #'private - ffi' }
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

{ #category : #'instance creation' }
SkiaConicalGradientShader class >> start: aStartPoint radius: aStartRadius end: anEndPoint radius: anEndRadius colors: theColors positions: thePositions mode: aTileMode flags: theBitFlags matrix: aSpartaMatrixOrNil [	
	
	^ self ffiLibrary
		newArrayF32WithAll: thePositions
		during: [ :thePositionsArrayF32 |
			self fromNativeHandle: (self
				primCreateStart: (self ffiLibrary newPointF32: aStartPoint)
				radius: aStartRadius
				end: (self ffiLibrary newPointF32: anEndPoint)
				radius: anEndRadius
				colors: (SkiaArrayColor fromColors: theColors)
				positions: thePositionsArrayF32
				mode: aTileMode
				flags: theBitFlags
				matrix: (SkiaMatrix fromSpartaMatrix: aSpartaMatrixOrNil)) ]
]
