private - ffi
primSetTransform: anArray

	^ self ffiCall: #( void moz2d_draw_target_transform_set (MozCanvas canvas, float* anArray) )