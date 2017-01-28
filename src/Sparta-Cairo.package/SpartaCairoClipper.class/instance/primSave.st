private - ffi
primSave

	^ self ffiCall: #(void cairo_save ( SpartaCairoCanvas canvas ) )