private - ffi
primLineToX: x Y: y absolute: isAbsolute

	^ self ffiCall: #(void moz2d_path_sink_line_to( self , float x, float y, bool isAbsolute))