private - ffi
primCreateSurface: aCairoSurface

	^ self ffiCall: #(SpartaCairoSurfacePattern cairo_pattern_create_for_surface ( SpartaCairoSurface aCairoSurface ) )