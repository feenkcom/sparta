private - ffi
primCopyPath

	^ self ffiCall: #(SpartaCairoPath cairo_copy_path ( SpartaCairoCanvas canvas ) )