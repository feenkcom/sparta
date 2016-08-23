private - ffi
primCreateFilter: aFilterType canvas: aMozCanvas
	^ self ffiCall: #(void* moz2d_filter_node_create(MozCanvas aMozCanvas, MozFilterType aFilterType))