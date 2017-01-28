private - ffi
primNewPath

	^ self ffiCall: #(void cairo_new_path ( SpartaCairoCanvas canvas ) )