private - ffi
primGetHeadless

	^ self ffiCall: #(SkiaGrContext moz2d_gl_get_gr_context ())