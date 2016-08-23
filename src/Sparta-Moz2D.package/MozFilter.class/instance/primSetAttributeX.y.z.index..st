private - ffi
primSetAttributeX: x y: y z: z index: anIndex

	^ self ffiCall: #(void moz2d_filter_node_set_attribute_point_3d (
		self,
		FFIExternalEnumeration anIndex,
		float x,
		float y,
		float z ) )