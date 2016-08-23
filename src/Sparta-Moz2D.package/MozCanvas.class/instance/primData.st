private - ffi
primData
	^ self ffiCall: #( uint32 * moz2d_draw_target_get_data ( self ) )