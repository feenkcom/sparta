private - ffi
primLoadIdentity

	^ self ffiCall: #( void cairo_matrix_init_identity ( self ) )