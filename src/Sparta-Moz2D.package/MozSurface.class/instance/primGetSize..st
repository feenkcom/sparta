private - ffi
primGetSize: anIntSize

	^ self ffiCall: #(void moz2d_source_surface_get_size ( self, MozNativeIntSize anIntSize ))