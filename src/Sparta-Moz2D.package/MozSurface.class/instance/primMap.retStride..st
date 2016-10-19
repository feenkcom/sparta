private - ffi
primMap: aDataSurface retStride: aRetStride

	^ self ffiCall: #(uint8 * moz2d_source_surface_map(MozSurface aDataSurface, void* aRetStride))