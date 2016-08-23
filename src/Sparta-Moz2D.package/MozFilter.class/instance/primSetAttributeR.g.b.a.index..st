private - ffi
primSetAttributeR: r g: g b: b a: a index: anIndex

	^ self ffiCall: #(void moz2d_filter_node_set_attribute_color (
		self,
		FFIExternalEnumeration anIndex,
		float r,
		float g,
		float b,
		float a ) )