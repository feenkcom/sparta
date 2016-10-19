private - ffi
primUnmap: aDataSource

	^ self ffiCall: #(void moz2d_source_surface_unmap(MozSurface aDataSource))