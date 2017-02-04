private - ffi
primGroupTarget

	^ self ffiCall: #(SpartaCairoSurface cairo_get_group_target ( SpartaCairoCanvas canvas ) )