private - ffi
primSetInputSurface: aSurface intIndex: anIndex

	^ self ffiCall: #(void moz2d_filter_node_set_input_surface ( self, int32 anIndex, MozSurface aSurface ) )