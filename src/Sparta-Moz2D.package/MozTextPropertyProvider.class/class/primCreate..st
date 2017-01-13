private - ffi
primCreate: aHash

	^ self ffiCall: #(void* moz2d_text_run_property_provider_create(ulong aHash))