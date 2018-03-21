private - ffi
primCreate: aSurface

	^ self ffiCall: #(SpartaCairoSvgCanvas cairo_create (SpartaCairoSurface aSurface) )