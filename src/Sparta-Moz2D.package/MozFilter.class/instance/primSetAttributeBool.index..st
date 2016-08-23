private - ffi
primSetAttributeBool: aBoolean index: anIndex

	^ self ffiCall: #(void moz2d_filter_node_set_attribute_bool(self, FFIExternalEnumeration anIndex, bool aBoolean))