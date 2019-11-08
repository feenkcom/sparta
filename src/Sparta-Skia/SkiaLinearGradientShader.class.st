Class {
	#name : #SkiaLinearGradientShader,
	#superclass : #SkiaGradientShader,
	#category : #'Sparta-Skia-External'
}

{ #category : #'instance creation' }
SkiaLinearGradientShader class >> from: aFromPoint to: aToPoint colors: theColors positions: thePositions mode: aTileMode flags: theBitFlags matrix: aSpartaMatrixOrNil [
	| theSkiaColors theSkiaPositions |
	
	theSkiaColors := SkiaArrayColor new: theColors size withAll: SkiaColor new.
	theColors withIndexDo: [ :eachColor :eachIndex | theSkiaColors at: eachIndex put: eachColor ].
	
	theSkiaPositions := GtBoxerArrayF32 new: thePositions size withAll: 0.
	thePositions withIndexDo: [ :eachPosition :eachIndex | theSkiaPositions at: eachIndex put: eachPosition ].
	
	^ self fromNativeHandle: (self
		primCreateFrom: (GtBoxerPointF32 fromPoint: aFromPoint)
		to: (GtBoxerPointF32 fromPoint: aToPoint)
		colors: theSkiaColors
		positions: theSkiaPositions
		mode: aTileMode
		flags: theBitFlags
		matrix: (aSpartaMatrixOrNil ifNil: [ SkiaMatrix null ] ifNotNil:  [ SkiaMatrix fromSpartaMatrix: aSpartaMatrixOrNil ]))
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
