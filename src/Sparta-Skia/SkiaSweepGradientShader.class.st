Class {
	#name : #SkiaSweepGradientShader,
	#superclass : #SkiaGradientShader,
	#category : 'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaSweepGradientShader class >> center: aCenterPoint startAngle: aStartAngle endAngle: anEndAngle colors: theColors positions: thePositions mode: aTileMode flags: theBitFlags matrix: aSpartaMatrixOrNil [
	^ self ffiLibrary
		newArrayF32WithAll: thePositions
		during: [ :thePositionsArrayF32 |
			self fromNativeHandle: (self
				primCreateAt: (self ffiLibrary newPointF32: aCenterPoint)
				startAngle: aStartAngle
				endAngle: anEndAngle
				colors: (SkiaArrayColor fromColors: theColors)
				positions: thePositionsArrayF32
				mode: aTileMode
				flags: theBitFlags
				matrix: (SkiaMatrix fromSpartaMatrix: aSpartaMatrixOrNil)) ]
]

{ #category : #'private - ffi' }
SkiaSweepGradientShader class >> primCreateAt: aCenter startAngle: aStartAngle endAngle: anEndAngle colors: theColors positions: thePositions mode: aTileMode flags: theBitFlags matrix: anOptionalMatrix [
	^ self ffiCall: #(void* skia_gradient_sweep_create(
		GtBoxerPointF32 aCenter,
		scalar aStartAngle,
		scalar anEndAngle,
		SkiaArrayColor theColors,
		GtBoxerArrayF32 thePositions,
		SkiaTileMode aTileMode,
		uint32 theBitFlags,
		SkiaMatrix anOptionalMatrix
	))
]
