private - ffi
primGetTransform: anArray

	^ self ffiCall: #( void moz2d_draw_target_transform_get (MozCanvas canvas, float* anArray) )