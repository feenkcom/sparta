private - ffi
primSetAttributeFloat: aFloat index: anIndex

	^ self ffiCall: #(void moz2d_filter_node_set_attribute_float(self, FFIExternalEnumeration anIndex, float aFloat))