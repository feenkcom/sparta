private - ffi - testing
primIsValid

	^ self ffiCall: #(bool moz2d_draw_target_is_valid ( self ) )