private - ffi
primCreate: aSurface

	^ self ffiCall: #(SpartaCairoPdfCanvas cairo_create (SpartaCairoSurface aSurface) )