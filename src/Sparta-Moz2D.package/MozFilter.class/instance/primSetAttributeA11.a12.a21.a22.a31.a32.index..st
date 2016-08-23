private - ffi
primSetAttributeA11: a11 a12: a12 a21: a21 a22: a22 a31: a31 a32: a32 index: anIndex

	^ self ffiCall: #(void moz2d_filter_node_set_attribute_matrix (
		self,
		FFIExternalEnumeration anIndex,
		float a11,
		float a12,
		float a21,
		float a22,
		float a31,
		float a32 ) )