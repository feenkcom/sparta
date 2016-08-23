private - ffi
primSetAttributeFloatArray: anArray length: aSize index: anIndex

	^ self ffiCall: #(void moz2d_filter_node_set_attribute_float_array (
		self,
		FFIExternalEnumeration anIndex,
		float* anArray,
		int32 aSize))