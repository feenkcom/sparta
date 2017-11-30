private - ffi
primToOpaque

	^ self ffiCall: #(MozSurface moz2d_source_surface_to_opaque ( self ))