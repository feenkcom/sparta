private - ffi
primRelease: aHandle

	^ self ffiCall: #(void moz2d_font_user_entry_release(void* aHandle))