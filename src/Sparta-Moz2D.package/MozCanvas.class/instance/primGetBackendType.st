private - ffi - accessing
primGetBackendType

	^ self ffiCall: #(MozBackendType moz2d_draw_target_get_backend_type ( self ) )