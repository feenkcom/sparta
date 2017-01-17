private - ffi
primSetInputCanvas: aSpartaCanvas intIndex: anIndex

	^ self ffiCall: #(void moz2d_filter_node_set_input_draw_target ( self, int32 anIndex, MozCanvas aSpartaCanvas ) )