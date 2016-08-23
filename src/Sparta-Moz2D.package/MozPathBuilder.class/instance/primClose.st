private - ffi
primClose

	^ self ffiCall: #(void moz2d_path_sink_close( self ) )