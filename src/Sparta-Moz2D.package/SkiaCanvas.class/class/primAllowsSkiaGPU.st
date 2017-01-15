private - ffi
primAllowsSkiaGPU
	^ self ffiCall: #(bool moz2d_gl_use_skia_gpu())