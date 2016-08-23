private - ffi - accessing
primGetSize: aSize

	^ self ffiCall: #(void moz2d_draw_target_get_size (self, MozNativeIntSize aSize ) )