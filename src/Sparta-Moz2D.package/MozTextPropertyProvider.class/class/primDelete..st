private - ffi
primDelete: aHandle
	^ self ffiCall: #(void moz2d_text_run_property_provider_delete(ulong aHandle))