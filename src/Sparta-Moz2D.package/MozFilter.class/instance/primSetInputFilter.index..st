private - ffi
primSetInputFilter: aFilter index: anIndex

	^ self ffiCall: #(void moz2d_filter_node_set_input_filter(self, FFIExternalEnumeration anIndex, MozFilter aFilter))