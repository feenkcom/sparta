private - ffi
primSetInputSurface: aSurface index: anIndex

	^ self ffiCall: #(void moz2d_filter_node_set_input_surface ( self, FFIExternalEnumeration anIndex, MozSurface aSurface ) )