private - ffi
primAppendPath: aCairoPath

	^ self ffiCall: #(void cairo_append_path (
			SpartaCairoCanvas canvas,
         SpartaCairoPath aCairoPath) )