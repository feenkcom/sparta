private - ffi
primBezierX1: x1 Y1: y1 X2: x2 Y2: y2 X3: x3 Y3: y3 absolute: isAbsolute

	^ self ffiCall: #(void moz2d_path_sink_bezier_to( self , float x1, float y1, float x2, float y2, float x3, float y3, bool isAbsolute) )