private - ffi
primRefCount: aHandle

	^ self ffiCall: #(uint cairo_surface_get_reference_count (void* aHandle) )