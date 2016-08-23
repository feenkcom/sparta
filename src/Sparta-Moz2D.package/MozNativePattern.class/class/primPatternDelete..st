private - ffi
primPatternDelete: aHandle

	^ self ffiCall: #( void moz2d_pattern_delete ( ulong aHandle ) )