private - ffi
primCreate: aCairoSurface

	^ self ffiCall: #(SpartaCairoCanvas cairo_create ( SpartaCairoSurface aCairoSurface ) )