Class {
	#name : #SkiaLinearGradientShader,
	#superclass : #SkiaGradientShader,
	#category : #'Sparta-Skia-External'
}

{ #category : #'as yet unclassified' }
SkiaLinearGradientShader class >> primCreateFrom: aFromPoint to: aToPoint colors: theColors positions: thePositions mode: aTileMode flags: theBitFlags matrix: anOptionalMatrix [
	^ self ffiCall: #(void* skia_gradient_linear_create(
		GtBoxerPointF32 aFromPoint,
		GtBoxerPointF32 aToPoint,
		 
	))


	"pub fn skia_gradient_linear_create(
    _from_point_ptr: *mut ValueBox<Point>,
    _to_point_ptr: *mut ValueBox<Point>,
    _colors_ptr: *mut ValueBox<BoxerArray<Color>>,
    _positions_ptr: *mut ValueBox<BoxerArray<scalar>>,
    _mode: TileMode,
    _bit_flags: u32,
    _matrix_ptr: *mut ValueBox<Matrix>
)"
]
