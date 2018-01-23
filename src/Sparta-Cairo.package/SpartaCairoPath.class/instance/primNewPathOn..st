private - ffi
primNewPathOn: aCanvas

	^ self ffiCall: #(void cairo_new_path ( SpartaCairoCanvas aCanvas ) )