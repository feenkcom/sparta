private - ffi
primAllowsAcceleratedCanvas
	^ self ffiCall: #(bool moz2d_gl_allow_accelerated_canvas())