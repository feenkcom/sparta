private - ffi
primSetAttributeEnum: anEnumValue index: anIndex

	^ self ffiCall: #(void moz2d_filter_node_set_attribute_int(self, FFIExternalEnumeration anIndex, FFIExternalEnumeration anEnumValue))