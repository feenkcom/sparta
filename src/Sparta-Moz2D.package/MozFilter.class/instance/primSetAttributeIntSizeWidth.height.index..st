private - ffi
primSetAttributeIntSizeWidth: aWidth height: aHeight index: anIndex

	^ self ffiCall: #(void moz2d_filter_node_set_attribute_int_size (
		self,
		FFIExternalEnumeration anIndex,
		int32 aWidth,
		int32 aHeight))