private - ffi
primSetAttributeIntRectX: aX y: aY width: aWidth height: aHeight index: anIndex

	^ self ffiCall: #(void moz2d_filter_node_set_attribute_int_rect (
		self,
		FFIExternalEnumeration anIndex,
		int32 aX,
		int32 aY,
		int32 aWidth,
		int32 aHeight ) )