private - ffi
primCreate: aSurface

	^ self ffiCall: #(SpartaCairoCanvas cairo_create (SpartaCairoSurface aSurface) )