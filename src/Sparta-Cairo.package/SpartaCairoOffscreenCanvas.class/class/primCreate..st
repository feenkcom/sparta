private - ffi
primCreate: aSurface

	^ self ffiCall: #(SpartaCairoOffscreenCanvas cairo_create (SpartaCairoSurface aSurface) )