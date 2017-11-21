private - ffi
primRelease: aHandle

	^ self ffiCall: #(void moz2d_font_group_release(void* aHandle))