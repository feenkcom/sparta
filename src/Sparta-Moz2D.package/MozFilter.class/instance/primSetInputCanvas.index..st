private - ffi
primSetInputCanvas: aSpartaCanvas index: anIndex

	^ self ffiCall: #(void moz2d_filter_node_set_input_draw_target ( self, FFIExternalEnumeration anIndex, MozCanvas aSpartaCanvas ) )