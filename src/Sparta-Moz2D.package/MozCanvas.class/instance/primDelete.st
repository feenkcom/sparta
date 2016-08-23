private - ffi
primDelete

	^ self ffiCall: #( void moz2d_draw_target_delete( self ) )