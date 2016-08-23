private - ffi - accessing
primGetStride

	^ self ffiCall: #(int32 moz2d_draw_target_get_stride( self ) )