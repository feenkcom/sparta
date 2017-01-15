private - ffi
primAllowsOpenGLCanvas
	^ self ffiCall: #(bool moz2d_gl_allow_opengl_canvas())