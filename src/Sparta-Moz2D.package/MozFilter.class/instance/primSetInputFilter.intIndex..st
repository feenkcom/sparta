private - ffi
primSetInputFilter: aFilter intIndex: anIndex

	^ self ffiCall: #(void moz2d_filter_node_set_input_filter(self, int32 anIndex, MozFilter aFilter))