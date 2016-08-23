private - ffi
primSetAttributeMatrix5x4: anArray index: anIndex

	^ self ffiCall: #(void moz2d_filter_node_set_attribute_matrix5x4 (
		self,
		FFIExternalEnumeration anIndex,
		float* anArray))