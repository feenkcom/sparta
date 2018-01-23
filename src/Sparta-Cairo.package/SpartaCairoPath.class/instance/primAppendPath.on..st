private - ffi
primAppendPath: aCairoPath on: aSpartaCairoCanvas

	^ self ffiCall: #(void cairo_append_path (
			SpartaCairoCanvas aSpartaCairoCanvas,
         SpartaCairoPath aCairoPath) )