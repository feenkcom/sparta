private - ffi
primSetAttributeSizeWidth: aWidth height: aHeight index: anIndex

	^ self ffiCall: #(void moz2d_filter_node_set_attribute_size (
		self,
		FFIExternalEnumeration anIndex,
		float aWidth,
		float aHeight))