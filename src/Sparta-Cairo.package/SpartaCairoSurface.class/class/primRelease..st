finalization
primRelease: aHandle

	^ self ffiCall: #(void cairo_surface_destroy (void* aHandle) )