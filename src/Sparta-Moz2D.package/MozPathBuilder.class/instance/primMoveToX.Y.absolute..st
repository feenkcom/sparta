private - ffi
primMoveToX: x Y: y absolute: isAbsolute

	^ self ffiCall: #(void moz2d_path_sink_move_to( self , float x, float y, bool isAbsolute))