private - ffi
primPopGroupToSource

	^ self ffiCall: #(void cairo_pop_group_to_source ( SpartaCairoCanvas canvas ) )