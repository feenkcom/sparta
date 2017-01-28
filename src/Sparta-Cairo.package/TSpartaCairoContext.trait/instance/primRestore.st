private - ffi
primRestore

	^ self ffiCall: #(void cairo_restore ( SpartaCairoCanvas canvas ) )